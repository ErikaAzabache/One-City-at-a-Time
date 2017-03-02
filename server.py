from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session, jsonify
from flask_debugtoolbar import DebugToolbarExtension

from models import connect_to_db, db
from models import Country, City, User, Place, Actiontype, Action, Tag, PlaceTag, Activation, Comment
from seed_test import search_country_code, country_code_dict
import json

from myemail import send_email
from random import randint, choice

from passlib.hash import argon2

from werkzeug import secure_filename
import requests
import os 


app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = '/uploads'
app.config['ALLOWED_EXTENSIONS'] = set(['png', 'jpg', 'jpeg'])
imgur_client_id = os.environ['IMGUR_CLIENT_ID']
imgur_secret = os.environ['IMGUR_CLIENT_SECRET']

# Required to use Flask sessions and the debug toolbar
app.secret_key = "SOSECRET"

# Raises an error when Jinja finds an undefined variable.
app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Homepage."""

    return render_template("homepage.html")


@app.route('/search', methods=['POST'])
def search_results():
    """Renders the results for a given city."""

    city_search = request.form.get("city_search").title()
    city_in_db = db.session.query(City).filter(City.name==city_search).first()

    if not city_in_db:
        flash("We couldn't find %s. Please choose another city." % (city_search))
        return redirect("/")
    else:
        city_id = db.session.query(City).filter(City.name==city_search).first().city_id
        places = db.session.query(Place).filter(Place.city_id==city_id).all() #list of objects
        if not places:
            flash("We couldn't find %s. Please choose another city." % (city_search))
            return redirect("/")
        else:
            user_id = session.get("user_id")
            if user_id:
                saved = db.session.query(Action).filter(Action.user_id==user_id, Action.action_code=='sav').all()
                user_sav = [an_obj.place_id for an_obj in saved]
                marked = db.session.query(Action).filter(Action.user_id==user_id, Action.action_code=='hbh').all()
                user_hbh = [an_obj.place_id for an_obj in marked]
            else:
                user_sav = []
                user_hbh = []

            return render_template("search_results.html", places=places, city=city_search, user_sav=user_sav, user_hbh=user_hbh)


@app.route('/search.json', methods=['GET'])
def search_results_json():
    """Sends places information for a given city and sort-by 
    option using a secondary search form in the results template"""

    city_search = request.args.get("city_search").title()
    city_search = city_search.lstrip().rstrip()

    sort_type = request.args.get("sort_type")

    city_in_db = db.session.query(City).filter(City.name==city_search).first()

    if not city_in_db:
        return jsonify(None) #choose another city please
    else: #if in city database
        city_id = db.session.query(City).filter(City.name==city_search).first().city_id
        places = db.session.query(Place).filter(Place.city_id==city_id).all() #DEFAULT
       
        if sort_type == "sort-name":
            places = sorted(places, key = lambda place: place.name)
        elif sort_type == "sort-least-pop":
            places = sorted(places, key = lambda place: place.rating)
        else:
            places = sorted(places, key = lambda place: place.rating, reverse=True)
       
        if not places:
            return jsonify(None) #choose another city
        else:
            user_id = session.get("user_id")
            return jsonify([{'name': place.name,
                            'address': place.address, 
                            'place_id': place.place_id, 
                            'rating': place.rating, 
                            'tags': [tag.tag_name for tag in place.tags], 
                            'latitud': place.latitud, 
                            'longitud': place.longitud, 
                            'city_id': place.city_id, 
                            'city_lat': place.city.latitud, 
                            'city_long': place.city.longitud,
                            "place_actions": [an_action.action_code for an_action in place.actions if an_action.user_id==user_id]} for place in places])

@app.route('/add-action.json', methods=['POST'])
def add_actions():
    """Adds actions to the database and returns an OK to indicate that the button should change."""

    action_type = request.form.get('action_type')
    place_id = request.form.get('place_id')
    user_id = session.get("user_id")

    if not user_id:
        flash("Please login.") #WHERE AM I flashing exactly?
        return jsonify({"result_code": "login", "action_type": action_type, "place_id": place_id})
    
    action_in_db = db.session.query(Action).filter(Action.user_id==user_id, Action.place_id==place_id, Action.action_code==action_type).first()
    if action_in_db:
        db.session.query(Action).filter(Action.action_id==action_in_db.action_id).delete()
        db.session.commit()
        return jsonify({"result_code": "undo", "action_type": action_type, "place_id": place_id})
    
    new_action = Action(user_id=user_id, place_id=place_id, action_code=action_type)
    db.session.add(new_action)
    db.session.commit()

    #this will tell JS to change the color of the button
    return jsonify({"result_code": "added", "action_type": action_type, "place_id": place_id})


@app.route('/register', methods=['GET'])
def register_form():
    """Show form for user signup."""

    country_list = sorted(country_code_dict.keys())

    return render_template("registration.html", countries=country_list)


@app.route('/register', methods=['POST'])
def register_process():
    """Adding registered user to database."""

    # Get form variables
    name = request.form["name"].title()
    lastname = request.form["lastname"].title()
    country = request.form["sel-country"].title()
    city = request.form["city"].title() #calculate city_id
    email = request.form["email"] #Unique
    password = argon2.hash(request.form["password"]) #hashed password
    picture = "http://i.imgur.com/Jckb780t.jpeg" #default

    #already registered?
    user_in_db = db.session.query(User).filter(User.email==email).first()
    if user_in_db:
        flash("%s, already exists." % email)
        return redirect("/register")
    else:
        #not registered yet, city info already exists? If not, add
        country_code = search_country_code(country)
        city_in_db = db.session.query(City).filter(City.name==city).first()

        if not city_in_db:
            new_city = City(name=city, country_code=country_code)
            db.session.add(new_city)
            db.session.commit()

        city_id = db.session.query(City).filter(City.name==city).first().city_id

        new_user = User(name=name, lastname=lastname, city_id=city_id, email=email, password=password, picture=picture) #is_activaded false

        db.session.add(new_user)
        db.session.commit()

        # flash("%s %s, your registration was completed. Please, check your email to activate your account" % (name, lastname))

        activation_number = randint(10**8, 10**12)
        new_activation = Activation(activation_number=activation_number, user_id=new_user.user_id)
        db.session.add(new_activation)
        db.session.commit()
        send_email(email, activation_number, 'activation')
        #return redirect("/login")
        return redirect("/activation_confirmation/%s" % new_user.user_id)


@app.route('/activation_confirmation/<int:user_id>', methods=['GET'])
def activation_confirmation(user_id):
    """Shows confirmation message."""

    return render_template("activation_confirmation.html", user_id=user_id)


@app.route('/activation_confirmation/<int:user_id>', methods=['POST'])
def activation_resend(user_id):
    """Allows to send the email again if not received."""

    activation_number = db.session.query(Activation).filter(Activation.user_id==user_id).first().activation_number
    email = db.session.query(User).get(user_id).email
    send_email(email, activation_number, 'activation')
    flash("Your account has been successfully activated.")
    return redirect("/login")


@app.route('/activation/<activation_number>')
def activation_process(activation_number):

    number_in_db = db.session.query(Activation).get(activation_number)

    if (number_in_db) and (not number_in_db.user.is_activated):
        user_id = number_in_db.user_id
        user = db.session.query(User).get(user_id)
        user.is_activated = True
        db.session.commit()
        return redirect("/login")
   
    return render_template("activation_error.html")


@app.route('/forgot_password', methods=['GET'])
def forgot_form():
    """Shows forgot password form"""

    return render_template("forgot_password.html")


@app.route('/forgot_password', methods=['POST'])
def forgot_process():
    """Sends email to reset password after submit"""

    email = request.form['email']
    user_in_db = db.session.query(User).filter(User.email==email).first()

    if not user_in_db:
        flash("User not registered")
        return redirect("/register")

    if not user_in_db.is_activated:
        flash("You need to activate your account first")
        return redirect("/login")

    reset_pass_number = randint(10**8, 10**12)
    number_in_db = db.session.query(Activation).filter(Activation.activation_number==reset_pass_number).first()
    while number_in_db:
        reset_pass_number = randint(10**8, 10**12)

    new_activation = Activation(activation_number=reset_pass_number, user_id=user_in_db.user_id)
    db.session.add(new_activation)
    db.session.commit()
    send_email(email, reset_pass_number, 'forgot_pass')
    flash("Please check your email to reset your password")
    return redirect("/login")


@app.route('/reset/<reset_number>', methods=['GET'])
def reset_process(reset_number):
    """Url in email that allows user to change their password"""

    return render_template("reset_password.html", num=reset_number)


@app.route('/reset/<reset_number>', methods=["POST"])
def update_password(reset_number):
    """Updates users table with new password"""

    new_password = argon2.hash(request.form["new_password"])
    number_in_db = db.session.query(Activation).get(reset_number)

    if not number_in_db:
        flash("You need to be a registered user to reset a password")
        return redirect("/register")

    user_id = number_in_db.user_id
    user = db.session.query(User).get(user_id)
    user.password = new_password
    db.session.commit()
    flash("Password successfully updated")
    return redirect("/login")

    
@app.route('/login', methods=['GET'])
def login_form():
    """Show login form."""

    return render_template("login.html")


@app.route('/login', methods=['POST'])
def login_process():
    """Process login."""

    email = request.form["email"]
    attempt = request.form["password"]

    user = User.query.filter(User.email==email).first()

    if user == None:
        flash("Wrong email. Please try again or register.")
        return redirect("/login")

    if not argon2.verify(attempt, user.password): #user.password is actually the hashed password
        flash("Incorrect password. Please try again.")
        return redirect("/login")

    if not user.is_activated:
        flash("Please activate your account.")
        return redirect("/login")
    else:
        session["user_id"] = user.user_id
        flash("Successfully logged in")
        return redirect("/users/%s" % user.user_id)


@app.route('/logout')
def logout():
    """Log out."""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")



@app.route("/users/<int:user_id>")
def profile(user_id):
    """Show user's profile"""

    user = db.session.query(User).get(user_id)

    return render_template("user.html", user=user)

@app.route("/edit_profile", methods=['POST'])
def edit_profile():
    """Edit user's profile"""

    user_id = request.form.get("user_id")
    description = request.form.get("description")

    user = db.session.query(User).get(int(user_id))
    user.description = description
    db.session.commit()

    return jsonify({"description": description})


@app.route("/user_actions.json")
def user_map():
    """Grabs user actions to show in user's profile"""

    user_id = request.args.get("user_profile")
    user_actions_obj = db.session.query(User).get(int(user_id)).actions
    
    return jsonify([{'action_code' : an_action.action_code,
                    'place_name' : an_action.place.name,
                    'place_address' : an_action.place.address,
                    'place_latitud' : an_action.place.latitud,
                    'place_longitud' : an_action.place.longitud} for an_action in user_actions_obj])

@app.route('/save_picture.json', methods=['POST'])
def upload():
    """Saving user's profile picture ID in database. 
    ID of picture uploaded on Imgur is provided by Imgur's API."""

    picture_id = request.form.get('pic_id')
    ext = request.form.get('extension')
    user_id = session.get("user_id")   
    
    base = "http://i.imgur.com/"
    pic_id = picture_id
    size = 't'
    link = base + pic_id + size + '.' + ext

    user = db.session.query(User).get(user_id)
    user.picture = link
    db.session.commit()

    return jsonify({"pic_url":link})

# @app.route('/download', methods=['GET'])
# def download():
#     """Getting user's profile picture ID from database using Imgur's API."""

#     headers = {"Authorization": "Client-ID " + imgur_client_id}
#     pic_id = 'a0YpdAq'
#     url = "https://api.imgur.com/3/image/" + pic_id

#     j1 = requests.get(url, headers=headers)

#     pic_id = json.loads(j1.text)["data"]["id"]
    
    #j1.text = {"data":{"id":"a0YpdAq","title":"Picture of Boli","description":null,"datetime":1487808672,"type":"image\/jpeg","animated":false,"width":768,"height":1024,"size":226297,"views":0,"bandwidth":0,"vote":null,"favorite":false,"nsfw":false,"section":null,"account_url":null,"account_id":null,"is_ad":false,"tags":[],"in_gallery":false,"link":"http:\/\/i.imgur.com\/a0YpdAq.jpg"},"success":true,"status":200}

    # Suffix  Name    Size
    # s       Small   90x90
    # b       Big     160x160
    # t       Small   160x160
    # m       Medium  320x320
    # l       Large   640x640
    # h       Huge    1024x1024

@app.route("/places/<int:place_id>", methods=['GET'])
def place_details(place_id):
    """Show more details about selected place."""

    place = db.session.query(Place).get(place_id)

    return render_template("place.html", place=place)


@app.route("/post_comment.json", methods=['POST'])
def post_comment():
    """Stores new comment in database"""

    user_id = session.get("user_id")
    place_id = request.form["place_id"]
    review = request.form["reviewtext"]

    new_comment = Comment(user_id=user_id, place_id=place_id, review=review)

    db.session.add(new_comment)
    db.session.commit()

    comment_in_db = db.session.query(Comment).filter(Comment.user_id==user_id, Comment.place_id==place_id, Comment.review==review).first()

    return jsonify({"user_id": user_id,
                    "comment": review,
                    "user_name": comment_in_db.user.name,
                    "comment_id":comment_in_db.comment_id})



if __name__ == "__main__":

    app.debug = True

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run(host='0.0.0.0', port=5000)
