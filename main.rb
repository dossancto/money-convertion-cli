#!/usr/bin/env ruby

# frozen_string_literal: true

require './src/currency_service'
require './src/cache_controll'
require './src/commands'
require 'json'

def main
  if ARGV.empty?
    puts 'Empty args'
    return
  end

  Commands.use_command(ARGV)
end

main
