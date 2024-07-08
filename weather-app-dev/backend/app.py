import traceback
from flask import Flask, render_template, request, url_for
import requests
import mysql.connector

app = Flask(__name__)

# Database configuration
db_config = {
    'user': 'root',
    'password': 'r00tp@ss%ord',
    'host': 'db',  # This should be the service name in docker-compose if using Docker
    'database': 'weather_app'
}

geo_info = {
    'Nigeria': (
        "Nigeria is located in West Africa and is the most populous country in Africa with over 200 million people. "
        "The country has a diverse geography with landscapes ranging from arid to humid equatorial. "
        "Nigeria's largest city is Lagos, which is one of the largest metropolitan areas in the world. "
        "The country is known for its rich cultural heritage, with over 250 ethnic groups, each with its own language and traditions. "
        "Nigeria has a varied climate with rainy and dry seasons, and it is rich in natural resources including oil and natural gas. "
        "Tourist attractions in Nigeria include the Zuma Rock, Yankari National Park, and the Olumo Rock."
    ),
    'Cameroon': (
        "Cameroon is a Central African country known for its geological and cultural diversity. "
        "The country has a coastline along the Atlantic Ocean and encompasses mountains, rainforests, savannas, and deserts. "
        "The highest point in Cameroon is Mount Cameroon, an active volcano that stands at 4,040 meters. "
        "Cameroon is often referred to as 'Africa in miniature' because it exhibits all the major climates and vegetation of the continent. "
        "The country is home to over 200 different ethnic groups and languages, making it a melting pot of cultures. "
        "Key attractions include the Waza National Park, the Dja Faunal Reserve, and the Lobé Waterfalls."
    ),
    'USA': (
        "The United States of America (USA) is a large country in North America consisting of 50 states. "
        "It is the third largest country by total area and population. "
        "The USA has diverse geography that includes mountains, plains, forests, and deserts. "
        "The country has a wide range of climates, from the arctic conditions of Alaska to the tropical climate of Hawaii. "
        "The USA is known for its cultural influence, technological innovation, and significant impact on global politics and economy. "
        "Tourist attractions include the Grand Canyon, Yellowstone National Park, and the Statue of Liberty."
    ),
    'London': (
        "London is the capital and largest city of England and the United Kingdom. "
        "Situated on the River Thames, London has a history dating back to Roman times. "
        "It is a leading global city with strengths in the arts, commerce, education, entertainment, fashion, finance, healthcare, media, professional services, research and development, tourism, and transportation. "
        "London is known for its diverse range of people and cultures, and more than 300 languages are spoken within its boundaries. "
        "Famous landmarks include the Houses of Parliament, the Tower of London, Buckingham Palace, and the London Eye. "
        "Other attractions are the British Museum, the National Gallery, and the West End theatre district."
    )
}

@app.route('/', methods=['GET'])
def index():
    country = request.args.get('country')
    weather = None
    if country:
        weather = get_weather_data(country)
    
    forecasts = {
        'Nigeria': get_weather_data('Nigeria'),
        'Cameroon': get_weather_data('Cameroon'),
        'USA': get_weather_data('USA'),
        'London': get_weather_data('London')
    }
    return render_template('index.html', weather=weather, forecasts=forecasts)

@app.route('/details', methods=['GET'])
def details():
    country = request.args.get('country')
    weather = get_weather_data(country)
    return render_template('details.html', weather=weather, geo_info=geo_info.get(country, "Geographical information not available."))

def get_weather_data(country):
    url = f"http://api.openweathermap.org/data/2.5/weather?q={country}&appid=bb74a0af31cb8649bbf3732f31d12c05&units=metric"
    response = requests.get(url)
    data = response.json()

    if response.status_code == 200:
        store_weather_data(data)
        return {
            'location': data.get('name', 'Unknown Location'),
            'temperature': data['main'].get('temp', 'No data'),
            'humidity': data['main'].get('humidity', 'No data'),
            'wind_speed': data['wind'].get('speed', 'No data'),
            'description': data['weather'][0].get('description', 'No data')
        }
    else:
        return {
            'location': 'API Error',
            'temperature': 'API Error',
            'humidity': 'API Error',
            'wind_speed': 'API Error',
            'description': 'API Error'
        }

def store_weather_data(weather_data):
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        query = """
        INSERT INTO weather (location, temperature, humidity, wind_speed, description)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query, (
            weather_data.get('name', 'Unknown'),
            weather_data['main'].get('temp', 'N/A'),
            weather_data['main'].get('humidity', 'N/A'),
            weather_data['wind'].get('speed', 'N/A'),
            weather_data['weather'][0].get('description', 'N/A')
        ))
        conn.commit()
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
    finally:
        cursor.close()
        conn.close()

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
