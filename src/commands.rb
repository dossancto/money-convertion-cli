require './src/currency_service'
require './src/cache_controll'
require 'json'

## Commands
module Commands
  def self.use_command(commands)
    money = commands[0].to_s.upcase
    value = commands[1]
    value = 1 if value.nil?

    if CacheControll.cache_yet_valid?
      content = CacheControll.currency_from_cache
      show_info(content, money, value)
      return
    end

    content = update_cache
    show_info(content, money, value)
  end

  def self.update_cache
    all_currency = CurrencyService.actual_currency
    puts CacheControll.valid_cache?

    json_currency = JSON.generate(all_currency)

    CacheControll.write_cache(json_currency)
    puts 'Cache updated'

    json_currency
  end

  def self.show_info(content, money, value)
    rates = content['rates']
    base = content['base']

    info = rates[money]

    if info.nil?
      puts "\"#{money}\" is not supported."
      return
    end

    conveted_value = info * value.to_f
    fixed_value = '%.2f' % conveted_value

    puts "Convert #{base} to #{money} is #{fixed_value}"
  end
end
