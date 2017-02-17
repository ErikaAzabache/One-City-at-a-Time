#import heapq
import time
from flask_sqlalchemy import SQLAlchemy

# This is the connection to the PostgreSQL database; we're getting this through
# the Flask-SQLAlchemy helper library. On this, we can find the `session`
# object, where we do most of our interactions (like committing, etc.)

db = SQLAlchemy()


##############################################################################
# Model definitions
class Country(db.Model):
    """Countries table to keep referential integrity."""

    __tablename__ = "countries"

    country_code = db.Column(db.String(2), primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.UnicodeText)
    latitud = db.Column(db.String(100))
    longitud = db.Column(db.String(100))
    picture = db.Column(db.String(200)) #url


    def __repr__(self):
        """Provide helpful representation when printed."""
        return "<Country country_code=%s name=%s description=%s latitud=%s longitud=%s picture=%s>" % (self.country_code, self.name, self.description, self.latitud, self.longitud)


class City(db.Model):
    """Cities table to keep referential integrity."""

    __tablename__ = "cities"

    city_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    country_code = db.Column(db.String(2), db.ForeignKey('countries.country_code'), nullable=False)
    latitud = db.Column(db.String(100))
    longitud = db.Column(db.String(100))
    description = db.Column(db.UnicodeText)
    picture = db.Column(db.String(200)) #url

    country = db.relationship("Country", backref="cities")


    def __repr__(self):
        """Provide helpful representation when printed."""
        return "<City city_id=%s name=%s country_code=%s latitud=%s longitud=%s description=%s picture=%s>" % (self.city_id, self.name, self.country_code, self.latitud, self.longitud, self.description, self.picture)


class User(db.Model):
    """Users registered in my website."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    lastname = db.Column(db.String(100), nullable=False)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'))
    email = db.Column(db.String(64), nullable=False)
    password = db.Column(db.String(20), nullable=False)
    picture = db.Column(db.String(200)) #url IF I can add profile pics in 2nd sprint

    # Define relationship to City
    city = db.relationship("City", backref="users")

    def __repr__(self):
        """Provide helpful representation when printed."""
        return "<User user_id=%s name=%s lastname=%s city_id=%s email=%s>" % (self.user_id, self.name, self.lastname, self.city_id, self.email)


class Place(db.Model):
    """Places are the search results ."""

    __tablename__ = "places"

    place_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    city_id = db.Column(db.Integer, db.ForeignKey('cities.city_id'), nullable=False)
    rating = db.Column(db.Float) #for sorting purposes only
    latitud = db.Column(db.String(100))
    longitud = db.Column(db.String(100))
    address = db.Column(db.String(200))
    description = db.Column(db.UnicodeText)
    picture = db.Column(db.String(200))
    url_4s = db.Column(db.String(200))

    # Define relationship to City and Tag
    city = db.relationship("City", backref="places")
    tags = db.relationship("Tag",
                             secondary="place_tags",
                             backref="places")

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Place place_id=%s name =%s city_id=%s>" % (self.place_id, self.name, self.city_id)


class Actiontype(db.Model):
    """Actions that can be performed by a user on a place"""

    __tablename__ = "actiontypes"

    action_code = db.Column(db.String(3), primary_key=True)
    action_name = db.Column(db.String(20), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Actiontype action_code=%s action_name =%s>" % (self.action_code, self.action_name)


class Action(db.Model):
    """Middle table for User and Place"""

    __tablename__ = "actions"

    action_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    place_id = db.Column(db.Integer, db.ForeignKey('places.place_id'), nullable=False)
    action_code = db.Column(db.String(3), db.ForeignKey('actiontypes.action_code'), nullable=False)

    # Define relationship to User, Place and Actiontype
    user = db.relationship("User", backref="actions")
    place = db.relationship("Place", backref="actions")
    actiontype = db.relationship("Actiontype", backref="actions")

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Action action_id=%s user_id =%s place_id=%s action_code=%s>" % (self.action_id, self.user_id, self.place_id, self.action_code)


class Tag(db.Model):
    """Table with classification of places, for tags during search. For referential integrity"""

    __tablename__ = "tags"

    tag_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    tag_name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Tag tag_id=%s tag_name=%s>" % (self.tag_id, self.tag_name)


class PlaceTag(db.Model):
    """Association table for Place and Tag"""

    __tablename__ = "place_tags"

    place_tag_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    place_id = db.Column(db.Integer, db.ForeignKey('places.place_id'), nullable=False)
    tag_id = db.Column(db.Integer, db.ForeignKey('tags.tag_id'), nullable=False)

    #relationship
    #tags = db.relationship("Tag", backref="placetags")
    #place = 

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<PlaceTag place_tag_id=%s place_id=%s tag_id=%s>" % (self.place_tag_id, self.place_id, self.tag_id)



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
