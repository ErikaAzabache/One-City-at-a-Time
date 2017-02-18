import os
import sys
import foursquare
import pprint 
import pickle
from models import connect_to_db, db, Country, City, Place, User, Tag, PlaceTag, Action, Actiontype
from random import randint, choice
import csv

client = foursquare.Foursquare(client_id = os.environ['CLIENT_ID'] , client_secret = os.environ['CLIENT_SECRET'])

with open('seed_data/alpha2_country_codes.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    country_code_dict = dict([(a_key, a_value) for a_key, a_value in csvreader])

def search_country_code(country_name):
    """Given a country name it returns its 2-letter code"""
    return country_code_dict[country_name]

def city_country_list():

    with open('seed_data/CityCountry.txt') as cities_file:
        city_country = [] #list of tuples(city, country)

        for line in cities_file:
            city_name, country_name = line.rstrip().split(', ')
            city_country.append((city_name, country_name))
    return city_country    

def load_countries():

    for name, code in country_code_dict.items():
        country = Country(country_code = code, name = name)
        db.session.add(country)
    db.session.commit()

def load_cities():
    """Loads cities from CityCountry.txt"""

    city_country = city_country_list()

    for a_city, a_country in city_country:
        results = client.venues.explore(params={'near': a_city, 'section' : 'sights', 'openNow' : 0})
        country_code = search_country_code(a_country)
        city_lat = results['geocode']['center']['lat']
        city_lng = results['geocode']['center']['lng']

        city = City(name=a_city, country_code=country_code, latitud=city_lat, longitud=city_lng)
        db.session.add(city)
    db.session.commit()

def load_places():
    """Loads places, tags and placetags tables using data from foursquare API"""

    city_country = city_country_list()
    all_results = [] #to save all searches in case I get blocked from 4S

    for a_city, a_country in city_country:
        results = client.venues.explore(params={'near': a_city, 'section' : 'sights', 'openNow' : 0})

        city_id = db.session.query(City).filter(City.name==a_city).first().city_id
        city_lat = results['geocode']['center']['lat']
        city_lng = results['geocode']['center']['lng']
        
        all_results.append(results)

        places = []
        for item_dict in results['groups'][0]['items']:
            rating = item_dict['venue']['rating']
            name = item_dict['venue']['name'][:100]
            categories = item_dict['venue']['categories']
            place_lat = item_dict['venue']['location']['lat']
            place_lng = item_dict['venue']['location']['lng']
            address = item_dict['venue']['location']['formattedAddress'][0]
            if item_dict.get('tips'):
                url_4s = item_dict['tips'][0]['canonicalUrl']
            else:
                url_4s = None

            place = Place(name=name, city_id=city_id, rating=rating, latitud=place_lat, longitud=place_lng, address=address, url_4s=url_4s)
            db.session.add(place)
            db.session.commit()

            place_id = db.session.query(Place).filter(Place.name==name).first().place_id

            for category in categories:
                tag = category['name']
                one_tag = db.session.query(Tag).filter(Tag.tag_name==tag).first()
                if not one_tag:
                    new_tag = Tag(tag_name=tag)
                    db.session.add(new_tag)
                    db.session.commit()
                tag_id = db.session.query(Tag).filter(Tag.tag_name==tag).first().tag_id
                a_placetag = PlaceTag(place_id=place_id, tag_id=tag_id)
                db.session.add(a_placetag)
                db.session.commit()

    with open('seed_data/foursquare_dump', 'w') as f:
        pickle.dump(all_results, f)


def load_users():
    """Users generated from online mock data"""

    signup_file = open('seed_data/signup.csv')

    for line in signup_file:
        name, lastname, email, password, country, city = line.rstrip().split(',')
    
        city_in_db = db.session.query(City).filter(City.name==city).first()
        if not city_in_db:
            country_code = search_country_code(country)
            new_city = City(name=city, country_code=country_code)
            db.session.add(new_city)
            db.session.commit()

        city_id = db.session.query(City).filter(City.name==city).first().city_id

        user = User(name=name, lastname=lastname, city_id=city_id, email=email, password=password)
        db.session.add(user)
    db.session.commit()


def load_actiontypes():
    """For now this website only offers two actions: save and havebeenhere"""

    save = Actiontype(action_code='sav', action_name='Save')
    havebeenhere = Actiontype(action_code='hbh', action_name='Have been here')

    db.session.add_all([save, havebeenhere])
    db.session.commit()

def load_actions():
    """Records of actions been applied to place results by users"""

    action_code_list = ['sav','hbh']

    for i in range(250): #generating an arbitrary number of actions (250 at most)
        user_id = randint(1, 1000) #load_users() will generate 1000 registered users
        place_id = randint(1, 3030) #load_places() will generate 3030 searchable places 
        action_code = choice(action_code_list)
        #checking if action has already been added to actions table
        action_in_db = db.session.query(Action).filter(Action.user_id==user_id, Action.place_id==place_id, Action.action_code==action_code).first()
        if not action_in_db:
            action = Action(user_id=user_id, place_id=place_id, action_code=action_code)
            db.session.add(action)
    db.session.commit()


if __name__ == "__main__":
    #connect_to_db(app)
    

    from server import app
    connect_to_db(app)
    print "Connected to DB."

    db.create_all()

    load_countries()
    load_cities()
    load_places()
    load_users()
    load_actiontypes()
    load_actions()
