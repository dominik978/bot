#!/usr/bin/env ruby
# frozen_string_literal: true

def what_time(where)
  case where
  when 'paris'
    Time.now.utc.localtime("+02:00").strftime("%H:%M")
  when 'papeete'
    Time.now.utc.localtime("-10:00").strftime("%H:%M")
  else
    "Mémé doesn't know this city !"
  end
end