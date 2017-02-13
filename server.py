from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session, jsonify
from flask_debugtoolbar import DebugToolbarExtension

from models import connect_to_db, db, Country, City, User, Place, Actiontype, Action, Tag, PlaceTag
from seed_test import search_country_code, country_code_dict
import json


app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "SOSECRET"

# Raises an error when Jinja finds an undefined variable.
app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Homepage."""

    return render_template("homepage.html")


@app.route('/search.json', methods=['POST'])
def search_results():
    """Search results."""
    city_search = request.form.get("city_search").title()
    city_in_db = db.session.query(City).filter(City.name==city_search).first()

    if not city_in_db:
        flash("We couldn't find %s. Please choose another city." % (city_search))
        return redirect("/")
    else:
        city_id = db.session.query(City).filter(City.name==city_search).first().city_id
        places = db.session.query(Place).filter(Place.city_id==city_id).all()
        if not places:
            flash("We couldn't find %s. Please choose another city." % (city_search))
            return redirect("/")
        else:
            return render_template("search_results.html", places=places)
            # places_info = [{'name':place.name, 'city_id':place.city_id} for place in places]

            # return jsonify(places_info)
            # return render_template("search_results.html")


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

        new_user = User(name=name, lastname=lastname, city_id=city_id, email=email, password=password)

        db.session.add(new_user)
        db.session.commit()

        flash("%s %s, your registration was completed." % (name, lastname))
        return redirect("/login")


@app.route('/login', methods=['GET'])
def login_form():
    """Show login form."""

    return render_template("login.html")


@app.route('/login', methods=['POST'])
def login_process():
    """Process login."""

    # From login form
    email = request.form["email"]
    password = request.form["password"]

    user = User.query.filter(User.email==email).first()

    if user == None:
        flash("Wrong email. Please try again or register.")
        return redirect("/login")

    elif user.password != password:
        flash("Incorrect password. Please try again")
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
