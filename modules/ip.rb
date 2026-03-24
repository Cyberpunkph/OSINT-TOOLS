require 'net/http'
require 'json'
require 'colorize'

def ip_lookup(ip)
  puts "\n[IP LOOKUP]".green
  begin
    url = URI("http://ip-api.com/json/#{ip}")
    res = Net::HTTP.get(url)
    data = JSON.parse(res)

    data.each { |k, v| puts "#{k}: #{v}" }
    data
  rescue
    puts "IP lookup failed".red
    {}
  end
end
