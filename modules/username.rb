require 'json'
require 'colorize'
require 'concurrent'
require_relative '../utils/http'
require_relative '../utils/detector'

def username_check(username, use_tor: false)
  puts "\n[USERNAME OSINT v4]".green
  sites = JSON.parse(File.read("config/sites.json"))
  found = []
  mutex = Mutex.new

  futures = sites.map do |site|
    Concurrent::Future.execute do
      url = site["url"].gsub("{username}", username)
      begin
        res = http_request(url, use_tor: use_tor)
        if detect_account(res, site)
          mutex.synchronize do
            puts "[FOUND] #{site['name']} -> #{url}".green
            found << { site: site["name"], url: url }
          end
        else
          puts "[NOT FOUND] #{site['name']}".red
        end
      rescue
        puts "[ERROR] #{site['name']}".yellow
      end
    end
  end

  futures.each(&:wait)
  found
end
