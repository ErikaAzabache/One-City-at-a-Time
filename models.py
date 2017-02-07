#import heapq
import time
from flask_sqlalchemy import SQLAlchemy

# This is the connection to the PostgreSQL database; we're getting this through
# the Flask-SQLAlchemy helper library. On this, we can find the `session`
# object, where we do most of our interactions (like committing, etc.)

db = SQLAlchemy()


##############################################################################
# Model definitions

class User(db.Model):
    """User registered in my website."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100))
    lastname = db.Column(db.String(100))
    country = db.Column(db.String(100))
    city = db.Column(db.String(100))
    email = db.Column(db.String(64))
    password = db.Column(db.String(20))

    def __repr__(self):
        """Provide helpful representation when printed."""
        return "<User user_id=%s name=%s lastname=%s country=%s city=%s email=%s>" % (self.user_id, self.name, self.lastname, self.country, self.city, self.email)


class Place(db.Model):
    """Places are the search results ."""

    __tablename__ = "places"

    place_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    city = db.Column(db.String(100), nullable=False)
    country = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(1000))
    rating = db.Column(db.Float) #for sorting purposes only
    #geocode = 
    #picture =

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Place place_id=%s name =%s city=%s country=%s>" % (self.place_id, self.name, self.city, self.country)



##############################################################################
# Helper functions

def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///places'
    app.config['SQLALCHEMY_ECHO'] = True
    db.app = app
    db.init_app(app)
    # db.create_all()

if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
