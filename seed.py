import os
import sys
import foursquare
import pprint 
import pickle
from models import connect_to_db, db, Country, Place, User
from random import randint, choice


client = foursquare.Foursquare(client_id = os.environ['CLIENT_ID'] , client_secret = os.environ['CLIENT_SECRET'])

def search_country_code(country_name):
    """Given a country name it returns its 2-letter code"""

    country_code_file = open('seed_data/alpha2_country_codes.csv')
    country_code_dict = {}

    for line in country_code_file:
        country, code = line.rstrip().split(',')
        country_code_dict[country] = code

    return country_code_dict[country_name]

def load_countries():

    countries_file = open('seed_data/alpha2_country_codes.csv')

    for line in countries_file:
        name, code = line.rstrip().split(',')

        country = Country(country_code = code, name=name)
        db.session.add(country)
    db.session.commit()


def load_cities():
    
    cities_file = open('seed_data/CityCountry.txt')
    city_country_list = [] #list of tuples(city, country)

    for line in cities_file:
        city_name, country_name = line.rstrip().split(', ')
        country_code = search_country_code(country_name)
        city_country_list.append((city, country))

    for a_city, a_country in city_country_list:
        results = client.venues.explore(params={'near': a_city, 'section' : 'sights', 'openNow' : 0})
        city_lat = results[u'geocode'][u'center'][u'lat']
        city_lng = results[u'geocode'][u'center'][u'lng']

        city = City(name=city_name, country_code=country_code, latitud=city_lat, longitud=city_lng)
        db.session.add(country)
    db.session.commit()

def load_places():

    #FOR PLACE IN PLACES
        #GET NAME, CITY_ID RATING, TAG_LIST
        #DB.SESSION.ADD PLACE (TAGS ARENT PART OF THE PLACE OBJECT)
        #DB.SESSION.COMMIT PLACE (OTHERWISE, CANT QUERY AND ADD TO TAGS TABLE)
        #FOR ONE_TAG IN TAG_LIST
            #ONE_TAG = DB.SESSION.QUERY(TAG).FILTER(NAME==TAG).FIRST()
            #IF NOT ONE_TAG
                #NEW_TAG=TAG(NAME=ONE_TAG)
                #DB.SESSION.ADD TAG
                #DB.SESSION.COMMIT TAG (OTHERWISE CANT QUERY AND ADD TO PLACETAGS TABLE)
            #DB.SESSION.QUERY(PLACE).FILTER(NAME==NAME).FIRST().PLACE_ID
            #DB.SESSION.QUERY(TAG).FILTER(TAG_NAME=ONE_TAG).FIRST().TAG_CODE
            #PLACETAG(PLACE_ID=, TAG_CODE=)
            #DB.SESSION.ADD PLACETAG
            #DB.SESSION.COMMIT PLACETAG


    cities_file = open('seed_data/CityCountry.txt')

    #Just to create the list of cities to query in the Foursquare API
    city_country_list = [] #list of tuples(city, country)
    all_results = [] #to save all searches in case I get blocked from 4S

    for line in cities_file:
        city, country = line.rstrip().split(', ') #line, the list
        city_country_list.append((city, country))

    for a_city, a_country in city_country_list:
        results = client.venues.explore(params={'near': a_city, 'section' : 'sights', 'openNow' : 0})

        city_id = db.session.query(City).filter(City.name == a_city).first().city_id
        city_lat = results[u'geocode'][u'center'][u'lat']
        city_lng = results[u'geocode'][u'center'][u'lng']
        
        all_results.append(results)

        ########places = [(item_dict[u'venue'][u'rating'], item_dict[u'venue'][u'name']) for item_dict in results[u'groups'][0][u'items']]
        places = [(item_dict[u'venue'][u'rating'], item_dict[u'venue'][u'name'], item_dict[u'venue'][u'categories'][0][u'name'], item_dict[u'venue'][u'location'][u'lat'], item_dict[u'venue'][u'location'][u'lng'], item_dict[u'tips'][0][u'canonicalUrl']) for item_dict in results[u'groups'][0][u'items']]

        for rating, name, tag_list, place_lat, place_lng, url_4s in places:
            name = name[:100] #limit name to 100 char
            
            place = Place(name=name, city_id=city_id, rating=rating, latitud=place_lat, longitud=place_lng, url_4s=url_4s)
            db.session.add(place)
    db.session.commit()

    with open('seed_data/places_dump', 'w') as f:
        pickle.dump(all_results, f)


def load_users():
    """Users generated from online mock data"""

    signup_file = open('seed_data/signup.csv')

    for line in signup_file:
        name, lastname, email, password, country, city = line.rstrip().split(',')
        #country_code = search_country_code(country)
        city_id = City.query.filter(City.name==city).first().city_id

        user = User(name=name, lastname=lastname, city_id=city_id, email=email, password=password)
        db.session.add(user)
    db.session.commit()


def load_actiontypes():
    """For now this website only offers two actions: save and havebeenhere"""

    save = Actiontype(action_code='sav', action_name='Save')
    havebeenhere = Actiontype(action_code='hbh', action_name='Have been here')

    db.session.add_all(save, havebeenhere)
    db.session.commit()

def load_actions():
    """Records of actions been applied to place results by users"""

    action_code_list = ['sav','hbh']

    for i in range(100): #generating an arbitrary number of actions
        user_id = randint(0, 999) #load_users() will generate 1000 registered users
        place_id = randint(0,3029) #load_places() will generate 3030 searchable places 
        action_code = choice(action_code_list)

        action = Action(user_id=user_id, place_id=place_id, action_code=action_code)
        db.session.add(action)
    db.session.commit()


def load_tag():
    """To tag the type of place to search"""   

    tag1 = Tag(tag_code='shp', tag_name='Shop')
    tag2 = Tag(tag_code='out', tag_name='Outdoors')
    tag3 = Tag(tag_code='mus', tag_name='Museums')
    tag4 = Tag(tag_code='mon', tag_name='Monuments')

    db.session.add_all(tag1, tag2, tag3, tag4)
    db.session.commit()

def load_placetag():
    """Records for association table for Place and Tag"""

    tag_list = ['shp','out','mus','mon']
    #In this case the places and tags need to make sense
    pass

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

