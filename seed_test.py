import os
import sys
import foursquare
import pprint 
import pickle
from models import connect_to_db, db, Country, City, Place, User, Tag, PlaceTag, Action, Actiontype, Activation, Comment
from random import randint, choice
import csv
from passlib.hash import argon2

client = foursquare.Foursquare(client_id = os.environ['FS_CLIENT_ID'] , client_secret = os.environ['FS_CLIENT_SECRET'])

with open('seed_data/alpha2_country_codes.csv', 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    country_code_dict = dict([(a_key, a_value) for a_key, a_value in csvreader])

def search_country_code(country_name):
    """Given a country name it returns its 2-letter code"""
    return country_code_dict[country_name]

def city_country_list():
    with open('seed_data/CityCountry_testset.txt') as cities_file:
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

            picture = 'https://i.imgur.com/iW4HZCH.jpg'
            description = "Hyde Park is one of the largest parks in London and one of its Royal Parks. The park is the largest of four that form a chain from the entrance of Kensington Palace through Kensington Gardens and Hyde Park, via Hyde Park Corner and Green Park past the main entrance to Buckingham Palace and on through Saint James's Park to Horse Guards Parade in Whitehall. The park is divided by the Serpentine and the Long Water."
            place = Place(name=name, city_id=city_id, rating=rating, latitud=place_lat, longitud=place_lng, address=address, url_4s=url_4s, picture=picture, description=description)
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

    is_activated_list = [True, False] 
    signup_file = open('seed_data/signup_testset.csv')
    profile_pic = "http://i.imgur.com/Jckb780t.jpeg"

    for line in signup_file:
        name, lastname, email, password, country, city = line.rstrip().split(',')
    
        city_in_db = db.session.query(City).filter(City.name==city).first()
        if not city_in_db:
            country_code = search_country_code(country)
            new_city = City(name=city, country_code=country_code)
            db.session.add(new_city)
            db.session.commit()

        city_id = db.session.query(City).filter(City.name==city).first().city_id
        is_activated = choice(is_activated_list)
        password = argon2.hash(password)
        description = "I love traveling, meeting new people, trying different kinds of food and learning new languages. There are so many places to visit and very little time!"

        user = User(name=name, lastname=lastname, city_id=city_id, email=email, password=password, is_activated=is_activated, picture=profile_pic, description=description)
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

    for i in range(20): #generating an arbitrary number of actions
        user_id = randint(1, 10) #load_users() will generate 1000 registered users
        place_id = randint(1, 150) #load_places() will generate 3030 searchable places 
        action_code = choice(action_code_list)

        action = Action(user_id=user_id, place_id=place_id, action_code=action_code)
        db.session.add(action)
    db.session.commit()


def load_activations():
    """Records of activation numbers by users"""
    for i in range(1,11): #load_users() loads 10 users
        activation_number = randint(10**8, 10**10)
        user_id = i

        activation = Activation(activation_number=activation_number, user_id=user_id)
        db.session.add(activation)
    db.session.commit()

def load_comments():
    """Records of comments by users about places"""
    text1 = "This place is fantastic! I come here every weekend with my kids. It's so peaceful and green. Love it!"
    text2 = "So overrated! Not worth your time! There's always somebody with their unleashed dog or taking selfies non-stop. I wish this place wasn't so popular."
    text3 = "So crowded in the weekend with lots of food trucks and dogs and kids. Probably going back but only on a weekday for a walk without all the weekend madness."
    text4 = "A friend of mine has been here and she thought it was beautiful and quiet. I'm visiting London next month and I'm strongly cosidering stopping by."
    text5 = "I used to live nearby but never been here. Now that I moved I really regret not taking the time to go there."
    text6 = "Used to be better, now is so mainstream. Everybody comes and leaves their dogs and children unattended. Now I can't walk around it without running into somebody!"
    text7 = "A must every time I'm in London. It's the perfect spot to grab a book and read with maybe a cup of tea. Tip: always wear a scarf and in winter a good coat and gloves."
    text8 = "Avoid this overrated place at all costs. Hate London, hate UK, hate the world aaaaaarrrrgh aaaaaarrrrgh aaaaaarrrrgh!"
    text9 = "This place blew my mind! I come from a place where parks are not really a part of a developed city, so when I so such greenery in the heart of London I almost cried! Definitely comming back."
    text10= "Noup, never coming back. It's getting dirtier and dirtier, trashed by people that don't know how to behave in society. Manners, people!"
    reviews = [text1, text2, text3, text4, text5, text6, text7, text8, text9, text10]

    for i in range(1,150):
        # user_id = randint(1, 10)
        # place_id = i
        # place_id = randint(1, 150)
        # review = choice(reviews)
        for review in reviews:
            user_id = randint(1, 10)
            place_id = i
            comment = Comment(user_id=user_id, place_id=place_id, review=review)
            db.session.add(comment)
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
    load_activations()
    load_comments()
