#!/usr/bin/env ruby
# frozen_string_literal: true

def what_time(where)
  case where
  when 'paris'
    t = Time.now.utc.localtime("+02:00").strftime("%H:%M")
    "Il est #{t} à Paris"
  when 'papeete'
    t = Time.now.utc.localtime("-10:00").strftime("%H:%M")
    "Il est #{t} à Papeete"
  when 'londres'
    t = Time.now.utc.localtime("+01:00").strftime("%H:%M")
    "Il est #{t} à Londres"
  when 'new-york'
    t = Time.now.utc.localtime("-04:00").strftime("%H:%M")
    "Il est #{t} à New York"
  when 'tokyo'
    t = Time.now.utc.localtime("+09:00").strftime("%H:%M")
    "Il est #{t} à Tokyo"
  when 'san-fransisco'
    t = Time.now.utc.localtime("-07:00").strftime("%H:%M")
    "Il est #{t} à San Fransisco"
  when 'moscou'
    t = Time.now.utc.localtime("+03:00").strftime("%H:%M")
    "Il est #{t} à Moscou"
  when 'berlin'
    t = Time.now.utc.localtime("+02:00").strftime("%H:%M")
    "Il est #{t} à Berlin"
  else
    "Mémé ne connait pas cette ville !"
  end
end