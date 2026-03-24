require 'resolv'
require 'colorize'

def dns_lookup(domain)
  puts "\n[DNS LOOKUP]".green
  begin
    ips = Resolv.getaddresses(domain)
    ips.each { |ip| puts "IP: #{ip}" }
    ips
  rescue
    puts "DNS lookup failed".red
    []
  end
end
