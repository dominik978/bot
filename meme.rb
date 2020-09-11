#!/usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'
require './weather.rb'
require './timezone.rb'

token = ENV['DISCORD_TOKEN']

# Instantiate Mémé
meme = Discordrb::Bot.new token: token

# Display how bot works
meme.message(content: '!man') { |event|
  event.user.pm("Pour échanger avec mémé tapez votre commande sur le chan #general \
    \n!man: affiche cette aide \
    \n!hello ou !bonjour: dire bonjour au bot \
    \n!time [ville]: affiche l'heure local dans la ville spécifiée si elle est connue \
    \n!weather [ville]: affiche la météo du moment dans la ville spécifiée si elle est connue (openweather) \
    \nExemple: !time papeete")
  event.message.delete
}

meme.message(content: /!hello|!bonjour/ ) { |event|
  if event.message.content.include?('!hello')
    event.user.pm("Hello #{event.user.name} !")
  else
    event.user.pm("Bonjour #{event.user.name} !")
  end
  event.message.delete
}

# Respond to time when a city is specified. Cities are hard coded in timezone.rb
meme.message(content: /!time\s[a-zA-Z]+(?:\s|\-[a-zA-Z]+)*/) { |event|
  # To do: change how city are splited. Currently new york doesn't work because there are several spaces
  k, v = event.message.content.split(" ")
  location_time = what_time(v)
  event.user.pm(location_time)
  event.message.delete
}

# Return the weather. I use openweather.org api 
meme.message(content: /!weather\s[a-zA-A]+(?:\s|\-[a-zA-Z]+)*/) { |event|
  k, v = event.message.content.split(" ")
  city_weather = get_weather(v)
  event.user.pm("#{city_weather['name']}, #{city_weather['main']['temp'].round}° #{city_weather['weather'][0]['description']} \
    \nHumidité: #{city_weather['main']['humidity']}%, Vent: #{((city_weather['wind']['speed'] / 1000) * 3600).round}Km/h")
  event.message.delete
}

meme.run
