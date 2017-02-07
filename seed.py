import os
import sys
import foursquare
import pprint 
import pickle
from models import connect_to_db, db, Place, User


client = foursquare.Foursquare(client_id = os.environ['CLIENT_ID'] , client_secret = os.environ['CLIENT_SECRET'])

def load_places():

    cities_file = open('seed_data/CountryCity.txt')

    #Just to create the list of cities to query in the Foursquare API
    city_country_list = [] #list of tuples(city, country)
    all_results = []

    for line in cities_file:
        city, country = line.rstrip().split(', ') #line, the list
        city_country_list.append((city, country))

    for a_city, a_country in city_country_list:
        results = client.venues.explore(params={'near': a_city, 'section' : 'sights', 'openNow' : 0})
        
        all_results.append(results)

        places = [(item_dict[u'venue'][u'rating'], item_dict[u'venue'][u'name']) for item_dict in results[u'groups'][0][u'items']]
        #list of tuples (rating,name)
        #sorted(places, reverse=True) CHECK!!!!!

        for place in places:
            name = place[1][:100] #limit name to 100 char
            city = a_city
            country = a_country
            rating = place[0]

            place = Place(name=name, city=city, country=country, rating=rating)
            db.session.add(place)
        db.session.commit() #should I commit at the end? should I commit every city?

    with open('seed_data/places_dump', 'w') as f:
        pickle.dump(all_results, f)


def load_users():

    signup_file = open('seed_data/signup.csv')
    for line in signup_file:
        name, lastname, email, password, country, city = line.rstrip().split(',')

        user = User(name=name, lastname=lastname, country=country, city=city, email=email, password=password)
        db.session.add(user)
    db.session.commit()


if __name__ == "__main__":
    #connect_to_db(app)
    

    from server import app
    connect_to_db(app)
    print "Connected to DB."

    db.create_all()
    load_places()
    load_users()

