import traceback
from flask import Flask, render_template, request
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

@app.route('/', methods=['GET'])
def index():
    country = request.args.get('country')
    weather = None
    if country:
        weather = get_weather_data(country)
    return render_template('index.html', weather=weather)

def get_weather_data(country):
    url = f"http://api.openweathermap.org/data/2.5/weather?q={country}&appid=bb74a0af31cb8649bbf3732f31d12c05&units=metric"
    response = requests.get(url)
    data = response.json()

    # Debugging output
    print("API response status code:", response.status_code)
    print("API response data:", data)

    # Check if the response is successful and contains the expected keys
    if response.status_code == 200 and 'name' in data:
        store_weather_data(data)
        return {
            'location': data.get('name', 'Unknown Location'),
            'temperature': data['main'].get('temp', 'No data'),
            'humidity': data['main'].get('humidity', 'No data'),
            'wind_speed': data['wind'].get('speed', 'No data'),
            'description': data['weather'][0].get('description', 'No description available')
        }
    else:
        print("Error: Missing expected keys in API response.")
        return {
            'location': 'API Error or invalid data',
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
        # Using .get() method to avoid KeyError
        cursor.execute(query, (
            weather_data.get('name', 'Unknown'),
            weather_data.get('main', {}).get('temp', 'N/A'),
            weather_data.get('main', {}).get('humidity', 'N/A'),
            weather_data.get('wind', {}).get('speed', 'N/A'),
            weather_data.get('weather', [{'description': 'N/A'}])[0].get('description')
        ))
        conn.commit()
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
