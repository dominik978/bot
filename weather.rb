#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

@token = ''
@city = ARGV[0] 


def get_weather()
  uri = URI('https://api.openweathermap.org/data/2.5/weather')
  params = { q: @city, appid: @token, units: 'metric', lang: 'fr' }
  uri.query = URI.encode_www_form(params)
  response = Net::HTTP.get_response(uri)

  if response.code == 401
    puts "Something goes wrong with your API key"
  elsif response.code == 404
    puts "You made a wrong request, perhaps your City is not available"
  elsif response.code == 409
    puts "You have reached your API calls limit"
  else
    JSON.parse(response.body)
  end
end

def get_icon(weather_icon)
  uri = URI("https://openweathermap.org/img/wn/#{weather_icon}.png")
  Net::HTTP.get(uri)
end



city_weather = get_weather
puts "#{city_weather['name']}, #{city_weather['weather'][0]['description']}"
puts "Min: #{city_weather['main']['temp_min']}°, Max: #{city_weather['main']['temp_max']}°"
puts "Humidité: #{city_weather['main']['humidity']}%, Vent: #{((city_weather['wind']['speed'] / 1000) * 3600).round}Km/h"
