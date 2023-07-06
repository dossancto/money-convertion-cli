# frozen_string_literal: true

require 'json'
require 'net/http'
require 'dotenv/load'

API_KEY = ENV['CURRENCY_API_KEY']

module CurrencyService
  def self.make_currency_request
    uri = URI("https://openexchangerates.org/api/latest.json?app_id=#{API_KEY}")
    Net::HTTP.get(uri)
  end

  def self.actual_currency
    JSON.parse(make_currency_request)
  end
end
