from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension

from models import connect_to_db, db, User

print "hey hey hey! Create model first!"

app = Flask(__name__)

# Required to use Flask sessions and the debug toolbar
app.secret_key = "SOSECRET"

# Raises an error when Jinja finds an undefined variable.
app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Homepage."""

    return render_template("homepage.html")


@app.route('/register', methods=['GET'])
def register_form():
    """Show form for user signup."""

    return render_template("register_form.html")


@app.route('/register', methods=['POST'])
def register_process():
    """Adding registered user to database."""

    # Get form variables
    name = request.form["name"]
    lastname = request.form["lastname"]
    country = request.form["country"]
    city = request.form["city"]
    email = request.form["email"] #needed to login
    password = request.form["password"] #needed to login

    new_user = User(name=name, lastname=lastname, country=country, city=city, email=email, password=password)

    db.session.add(new_user)
    db.session.commit()

    flash("%s %s, your registration was completed." % (name, lastname))
    return redirect("/login")


@app.route('/login', methods=['GET'])
def login_form():
    """Show login form."""

    return render_template("login_form.html")


# @app.route('/login', methods=['POST'])
# def login_process():
#     """Process login."""

#     # From login form
#     email = request.form["email"]
#     password = request.form["password"]

#     user = User.query.filter_by(email=email).first()

#     if user == None:
#         flash("%s does not exist. Please try again or register." % email)
#         return redirect("/login")

#     elif user.password != password:
#         flash("Incorrect password")
#         return redirect("/login")

#         else:
#             session["user_id"] = user.user_id
#             flash("Logged in")
#             return redirect("/users/%s" % user.user_id)


@app.route('/logout')
def logout():
    """Log out."""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")



@app.route("/users/<int:user_id>")
def profile(user_id):
    """Show user's profile"""

    user = User.query.get(user_id)
    return render_template("user.html", user=user)



@app.route("/places/<int:place_id>", methods=['GET'])
def place_details(place_id):
    """Show more details about selected place."""

    pass



if __name__ == "__main__":

    app.debug = True

    connect_to_db(app)

    DebugToolbarExtension(app)

    app.run()
