#!/usr/bin/env ruby
# frozen_string_literal: true

require 'discordrb'
token = ENV['DISCORD_TOKEN']

puts token

meme = Discordrb::Bot.new token: "#{token}"

meme.message(with_text: 'Hello') { |event|
  event.respond 'Hello !'
}

meme.run

