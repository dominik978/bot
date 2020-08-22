#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

@token = ENV['OPENWEATHER_KEY'] 

def get_weather(city)
  uri = URI('https://api.openweathermap.org/data/2.5/weather')
  params = { q: city, appid: @token, units: 'metric', lang: 'fr' }
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