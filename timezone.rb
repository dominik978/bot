#!/usr/bin/env ruby
# frozen_string_literal: true

def what_time(where)
  case where
  when 'paris'
    t = Time.now.utc.localtime("+02:00").strftime("%H:%M")
    "il est #{t} à Paris"
  when 'papeete'
    t = Time.now.utc.localtime("-10:00").strftime("%H:%M")
    "il est #{t} à Papeete"
  else
    "Mémé doesn't know this city !"
  end
end