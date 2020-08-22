#!/usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'
require './weather.rb'
require './timezone.rb'

token = ENV['DISCORD_TOKEN']

# Instantiate the Mémé
meme = Discordrb::Bot.new token: "#{token}"

meme.message(content: '!man') { |event|
  event.user.pm("Comment Mémé fonctionne: \
    \n!man: affiche cette aide
    \n!hello: répond hello
    \n!time [ville]: affiche l'heure local dans la ville spécifiée (seulement Paris et Papeete) \
    \n!weather [ville]: affiche la météo du moment dans la ville spécifiée (seulement Paris et Papeete)")
  event.message.delete
}

meme.message(content: '!hello' ) { |event|
  event.user.pm("Hello #{event.user.name} !")
  event.message.delete
}

meme.message(content: '!time paris') { |event|
  location_time = what_time('paris')
  event.user.pm("Il est #{location_time} à Paris")
  event.message.delete
}

meme.message(content: '!time papeete') { |event|
  location_time = what_time('papeete')
  event.user.pm("Il est #{location_time} à Papeete")
  event.message.delete
}

meme.message(content: '!weather paris') { |event|
  city_weather = get_weather('paris')
  event.user.pm("#{city_weather['name']}, #{city_weather['main']['temp']}° #{city_weather['weather'][0]['description']}\
    \nHumidité: #{city_weather['main']['humidity']}%, Vent: #{((city_weather['wind']['speed'] / 1000) * 3600).round}Km/h")
  event.message.delete
}

meme.message(content: '!weather papeete') { |event|
  city_weather = get_weather('papeete')
  event.user.pm("#{city_weather['name']}, #{city_weather['weather'][0]['description']}\
    \nMin: #{city_weather['main']['temp_min']}°, Max: #{city_weather['main']['temp_max']}°\
    \nHumidité: #{city_weather['main']['humidity']}%, Vent: #{((city_weather['wind']['speed'] / 1000) * 3600).round}Km/h")
  event.message.delete
}

meme.run
