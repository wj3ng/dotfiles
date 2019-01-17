#!/bin/env python
import pyowm
import sys

try:
	owm = pyowm.OWM('3e083ac0be745bcacc1eed7f2991738b')
	if not owm.is_API_online():
		print(' OWN offline')
	else:
		obs = owm.weather_at_coords(33.633210, -117.795971)
		wea = obs.get_weather()
	
		condition = wea.get_weather_code()
		icons = {'01d':'','02d':'','03d':'','04d':'','09d':'','10d':'','11d':'','13d':'','50d':'','01n':'','02n':'','03n':'','04n':'','09n':'','10n':'','11n':'','13n':'','50n':'',}
		text = {
			200:'Thunderstorm with light rain',
			201:'Thunderstorm with rain',
			202:'Thunderstorm with heavy rain',
			210:'Light thunderstorm',
			211:'Thunderstorm',
			212:'Heavy thunderstorm',
			221:'Ragged thunderstorm',
			230:'Thunderstorm with light drizzle',
			231:'Thunderstorm with drizzle', 232:'Thunderstorm with heavy drizzle',
			300:'Light intensity drizzle',
			301:'Drizzle',
			302:'Heavy intensity drizzle',
			310:'Light intensity drizzle rain',
			311:'Drizzle rain',
			312:'Heavy intensity drizzle rain',
			313:'Shower rain and drizzle',
			314:'Heavy shower rain and drizzle',
			321:'Shower drizzle',
			500:'Light rain',
			501:'Moderate rain',
			502:'Heavy intensity rain',
			503:'Very heavy rain',
			504:'Extreme rain',
			511:'Freezing rain',
			520:'Light intensity shower rain',
			521:'Shower rain',
			522:'Heavy intensity shower rain',
			531:'Ragged shower rain',
			600:'Light snow',
			601:'Snow',
			602:'Heavy snow',
			611:'Sleet',
			612:'Shower sleet',
			615:'Light rain and snow',
			616:'Rain and snow',
			620:'Light shower snow',
			621:'Shower snow',
			622:'Heavy shower snow',
			701:'Mist',
			711:'Smoke',
			721:'Haze',
			731:'Sand, dust whirls',
			741:'Fog',
			751:'Sand',
			761:'Dust',
			762:'Volcanic ash',
			771:'Squalls',
			781:'Tornado',
			800:'Clear sky',
			801:'Few clouds',
			802:'Scattered clouds',
			803:'Broken clouds',
			804:'Overcast clouds'
		}
	
		icon = icons.get(wea.get_weather_icon_name())
		code = text.get(wea.get_weather_code())
		tc = str(int(wea.get_temperature('celsius').get('temp') + 0.5))
		tf = str(int(wea.get_temperature('fahrenheit').get('temp') + 0.5))

		if len(sys.argv)>=2 and sys.argv[1] == 'm':
			if len(sys.argv)>=3 and sys.argv[2] == 'c':
				print(icon + ' ' + tc + '°C')
			elif len(sys.argv)>=3 and sys.argv[2] == 'f':
				print(icon + ' ' + tf + '°F')
			else:
				print(icon + ' ' + tc + '°C / ' + tf + '°F')
		else:
			if len(sys.argv)>=2 and sys.argv[1] == 'c':
				print(icon + ' ' + code + ' ' + tc + '°C')
			elif len(sys.argv)>=2 and sys.argv[1] == 'f':
				print(icon + ' ' + code + ' ' + tf + '°F')
			else:
				print(icon + ' ' + code + ' ' + tc + '°C / ' + tf + '°F')
				
except:
	if len(sys.argv)>=2 and sys.argv[1] == 'm':
		print('')
	else:
		print(' No internet connection')
