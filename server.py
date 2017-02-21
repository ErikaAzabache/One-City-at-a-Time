from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session, jsonify
from flask_debugtoolbar import DebugToolbarExtension

from models import connect_to_db, db
from models import Country, City, User, Place, Actiontype, Action, Tag, PlaceTag, Activation
from seed_test import search_country_code, country_code_dict
import json
from myemail import send_email
from random import randint, choice 


app = Flask(__name__)

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
            return render_template("search_results.html", places=places, city=city_search)


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
            return jsonify([{'name': place.name,
                            'address': place.address, 
                            'place_id': place.place_id, 
                            'rating': place.rating, 
                            'tags': [tag.tag_name for tag in place.tags], 
                            'latitud': place.latitud, 
                            'longitud': place.longitud, 
                            'city_id': place.city_id, 
                            'city_lat': place.city.latitud, 
                            'city_long': place.city.longitud} for place in places])


@app.route('/add-action', methods=['POST'])
def add_actions():
    """Adds actions to the database and returns an OK to indicate that the button should change."""

    action_type = request.form.get('action_type')
    place_id = request.form.get('place_id')
    user_id = session.get("user_id")

    if not user_id:
        flash("Please login.") #WHERE AM I flashing exactly?
        #return "Hey girl...login for me please" #have to return something or ajax will fail
        return jsonify({"result_code": "login"})
    #one or none
    action_in_db = db.session.query(Action).filter(Action.user_id==user_id, Action.place_id==place_id, Action.action_code==action_type).first()
    if action_in_db:
        db.session.query(Action).filter(Action.action_id==action_in_db.action_id).delete()
        db.session.commit()
        #return "Hey girl...you already did that so undoing it." #have to return something or ajax will fail
        return jsonify({"result_code": "undo"})
    #Else, add new_action:
    new_action = Action(user_id=user_id, place_id=place_id, action_code=action_type)
    db.session.add(new_action)
    db.session.commit()

    #this will tell JS to change the color of the button
    #return "It's all good. Love, your server"
    return jsonify({"result_code": "added"})


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
    email = request.form["email"] #needed to login. Unique
    password = request.form["password"] #needed to login

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

        new_user = User(name=name, lastname=lastname, city_id=city_id, email=email, password=password) #already false

        db.session.add(new_user)
        db.session.commit()

        flash("%s %s, your registration was completed. Please, check your email to activate your account" % (name, lastname))

        activation_number = randint(10**8, 10**10)
        new_activation = Activation(activation_number=activation_number, user_id=new_user.user_id)
        db.session.add(new_activation)
        db.session.commit()
        send_email(email, activation_number)
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
    else:
        return render_template("activation_error.html")

    
@app.route('/login', methods=['GET'])
def login_form():
    """Show login form."""

    return render_template("login.html")


@app.route('/login', methods=['POST'])
def login_process():
    """Process login."""

    email = request.form["email"]
    password = request.form["password"]

    user = User.query.filter(User.email==email).first()

    if user == None:
        flash("Wrong email. Please try again or register.")
        return redirect("/login")

    elif user.password != password:
        flash("Incorrect password. Please try again.")
        return redirect("/login")

    elif not user.is_activated:
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



@app.route("/places/<int:place_id>", methods=['GET'])
def place_details(place_id):
    """Show more details about selected place."""

    place = db.session.query(Place).get(place_id)

    return render_template("place.html", place=place)



if __name__ == "__main__":

    app.debug = True

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run(host='0.0.0.0', port=5001)
