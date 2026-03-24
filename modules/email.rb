require 'net/http'
require 'uri'
require 'colorize'

def email_scraper(url)
  puts "\n[EMAIL SCRAPER]".green
  begin
    html = Net::HTTP.get(URI(url))
    emails = html.scan(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z]{2,}\b/i)

    emails.uniq.each { |e| puts e }
    emails.uniq
  rescue
    puts "Failed to fetch URL".red
    []
  end
end
