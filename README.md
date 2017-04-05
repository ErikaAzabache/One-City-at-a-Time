# One City at a Time
One City at a Time is an app meant for users that love traveling. The app shows main points of interest in popular cities around the world. Registered users can save their preferred spots for future trips, mark places they have already been and leave comments/reviews in the place's page.

<img src="/static/images/_readme/OCAAT_homepage.png">

## Table of Contents

* [Tech Stack](#tech-stack)
* [Features](#features)
* [Setup/Installation](#installation)
* [Looking Ahead](#future)

## <a name="tech-stack"></a>Tech Stack

__Frontend:__ HTML5, Jinja, Javascript (AJAX, JSON), jQuery, Bootstrap <br/>
__Backend:__ Python, Flask, PostgreSQL, SQLAlchemy <br/>
__APIs:__ Foursquare, Google maps, Imgur, Bing Image Search <br/>

## <a name="features"></a>Features
* Create an account and activate it.<br/>
* Logged in or not, search points of interest in a city. Sort results by popularity (most and least popular) or name.<br/>
* If logged in, user can save or "been here" a place.<br/>
* User profile is editable.<br/>
* User (logged in ot not) can check more information about a place. Logged in user can also leave comments.<br/>

## <a name="installation"></a>Setup/Installation

####Requirements:

- PostgreSQL
- Python 2.7
- Foursquare, Google maps, Imgur, and Bing Image Search API keys

To run this app on your local computer, please complete the following steps:

Clone repository:
```
$ git clone https://github.com/ErikaAzabache/One-City-at-a-Time.git
```
Create a virtual environment:
```
$ virtualenv env
```
Activate the virtual environment:
```
$ source env/bin/activate
```
Install dependencies:
```
$ pip install -r requirements.txt
```
Get your own secret keys for [Foursquare](https://developer.foursquare.com), [Google Maps](https://developers.google.com/maps/), [Imgur](https://api.imgur.com/oauth2), and [Bing Image Search](https://www.microsoft.com/cognitive-services/en-us/bing-image-search-api). Save them in your `secrets.sh` file. Your file should look something like this:
```
export FS_CLIENT_ID="123"
export FS_CLIENT_SECRET="123"
export IMGUR_CLIENT_ID="123"
export IMGUR_CLIENT_SECRET="123"
```
Create database 'places'.
```
$ createdb places
```
Create your database tables and seed example data.
```
$ python models.py
```
Run the app from the command line.
```
$ python server.py
```
If you want to use SQLAlchemy to query the database, run in interactive mode
```
$ python -i models.py
```
## <a name="future"></a>Looking Ahead
* Test app for security vulnerabilities 
* Add nested comments
* Add ratings system for comments
* Add place suggestions based on user's "saved" and "been here"
