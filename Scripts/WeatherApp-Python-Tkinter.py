import requests
import tkinter as tk
from tkinter import messagebox

API_KEY = 'e4a60ec2391f433182482bb3a91815ca'  # Replace with your Weatherbit API key

def get_weather_data(city_name):
    url = f"https://api.weatherbit.io/v2.0/current"
    params = {
        "city": city_name,
        "key": API_KEY,
        "units": "I"
    }

    response = requests.get(url, params=params)

    if response.status_code == 200:
        data = response.json()
        return data
    else:
        return None

#显示天气信息
def display_weather(data):
    if data:
        weather_data = data["data"][0]
        weather_info.set(f"Weather in {weather_data['city_name']}, {weather_data['country_code']}:\n"
                         f"Temperature: {weather_data['temp']}°F\n"
                         f"Description: {weather_data['weather']['description']}\n"
                         f"Humidity: {weather_data['rh']}%\n"
                         f"Wind Speed: {weather_data['wind_spd']} m/s")
    else:
        weather_info.set("Error fetching weather data.")

#获取天气按钮的点击事件
def get_weather():
    city = city_entry.get()
    weather_data = get_weather_data(city)
    display_weather(weather_data)

# Create the main GUI window
root = tk.Tk()
root.title("Weather App")
root.geometry("400x300")  # Set the initial size of the window

# Create and configure GUI elements
title_label = tk.Label(root, text="Weather App", font=("Helvetica", 18, "bold"))
title_label.pack(pady=10)

city_label = tk.Label(root, text="Enter city name:")
city_label.pack()

city_entry = tk.Entry(root, font=("Helvetica", 12))
city_entry.pack(pady=5)

get_button = tk.Button(root, text="Get Weather", command=get_weather, font=("Helvetica", 12, "bold"))
get_button.pack()

weather_info = tk.StringVar()
weather_label = tk.Label(root, textvariable=weather_info, font=("Helvetica", 12), justify="left")
weather_label.pack(pady=10)

# Start the GUI event loop
root.mainloop()
