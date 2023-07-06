# frozen_string_literal: true

require 'json'

CACHE_DIRECTORY = File.join(Dir.home, '.cache/money')
CACHE_FILE_LOCATION = File.join(CACHE_DIRECTORY, 'money_cache.json')

MAX_ALIVE = 60 * 60 * 1000 # 1 Hour

module CacheControll
  def self.setup_config_file
    Dir.mkdir(CACHE_DIRECTORY) unless Dir.exist?(CACHE_DIRECTORY)
  end

  def self.read_cache
    File.read(CACHE_FILE_LOCATION)
  end

  def self.currency_from_cache
    JSON.parse(read_cache)
  end

  def self.valid_cache?
    return false unless File.exist? CACHE_FILE_LOCATION
    return false unless Dir.exist? CACHE_DIRECTORY

    true
  end

  def self.cache_yet_valid?
    return false unless valid_cache?

    parsed_content = JSON.parse(read_cache)

    given_timestamp = parsed_content['timestamp']

    current_timestamp = Time.now.to_i
    time_difference = current_timestamp - given_timestamp

    time_difference < MAX_ALIVE
  end

  def self.write_cache(content)
    setup_config_file

    puts CACHE_FILE_LOCATION

    # Open the file in write mode
    File.open(CACHE_FILE_LOCATION, 'w') do |file|
      # Write content to the file
      file.puts content
    end
  end
end
