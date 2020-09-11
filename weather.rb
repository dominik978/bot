#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

@token = ENV['OPENWEATHER_KEY'] 

# Get current weather
def get_weather(city)
  uri = URI('https://api.openweathermap.org/data/2.5/weather')
  params = { q: city, appid: @token, units: 'metric', lang: 'fr' }
  uri.query = URI.encode_www_form(params)
  response = Net::HTTP.get_response(uri)

  JSON.parse(response.body)
end

# Get weather forcat for 5days, every 3 hours
def get_forcast(city)
  uri = URI('https://api.openweathermap.org/data/2.5/forecast')
  params = { q: city, appid: @token, units: 'metric', lang: 'fr' }
  uri.query = URI.encode_www_form(params)
  response = Net::HTTP.get_response(uri)

  JSON.parse(response.body)
end
