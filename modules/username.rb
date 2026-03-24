require 'json'
require 'colorize'
require 'concurrent'

require_relative '../utils/http'
require_relative '../utils/detector'

def username_check(username, use_tor: false, stealth: false)
  puts "\n[USERNAME OSINT v5]".green

  sites = JSON.parse(File.read("config/sites.json"))

  found = []
  mutex = Mutex.new

  # ⚡ dynamic thread count
  threads = stealth ? 8 : 25
  pool = Concurrent::FixedThreadPool.new(threads)

  sites.each do |site|
    pool.post do
      url = site["url"].gsub("{username}", username)

      begin
        # 🕶️ stealth delay
        sleep(rand(0.3..1.0)) if stealth

        res = http_request(url, use_tor: use_tor)

        if detect_account(res, site)
          mutex.synchronize do
            puts "[FOUND] #{site['name']}".green
            found << { site: site["name"], url: url }
          end
        end

      rescue
        # silent fail for speed
      end
    end
  end

  pool.shutdown
  pool.wait_for_termination

  puts "\nScan complete: #{found.size} hits".cyan

  found
end
