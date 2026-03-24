require 'net/http'
require 'json'
require 'colorize'

def subdomain_enum(domain)
  puts "\n[SUBDOMAIN ENUM]".green
  begin
    url = URI("https://crt.sh/?q=%25.#{domain}&output=json")
    res = Net::HTTP.get(url)
    data = JSON.parse(res)

    subs = data.map { |e| e["name_value"] }.uniq
    subs.each { |s| puts s }

    subs
  rescue
    puts "Subdomain enum failed".red
    []
  end
end
