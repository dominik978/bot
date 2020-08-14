#!/usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'
require './weather.rb'

token = ENV['DISCORD_TOKEN']

# Instantiate the Mémé
meme = Discordrb::Bot.new token: "#{token}"
  
meme.message(content: '!hello' ) { |event|
  event.user.pm("Hello #{event.user.name}")
}

meme.message(content: '!weather') { |event|
  city_weather = get_weather
  event.user.pm("#{city_weather['name']}, #{city_weather['weather'][0]['description']}\
    \nMin: #{city_weather['main']['temp_min']}°, Max: #{city_weather['main']['temp_max']}°\
    \nHumidité: #{city_weather['main']['humidity']}%, Vent: #{((city_weather['wind']['speed'] / 1000) * 3600).round}Km/h")
}


meme.run

