#!/usr/bin/env ruby

require 'optparse'
require 'colorize'

require_relative 'modules/username'
require_relative 'modules/dns'
require_relative 'modules/ip'
require_relative 'modules/email'
require_relative 'modules/subdomain'
require_relative 'utils/report'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: ruby main.rb [options]"

  opts.on("-n USERNAME", "Username OSINT") { |v| options[:username] = v }
  opts.on("-d DOMAIN", "Domain OSINT") { |v| options[:domain] = v }
  opts.on("-i IP", "IP Lookup") { |v| options[:ip] = v }
  opts.on("-u URL", "Email Scraper") { |v| options[:url] = v }
  opts.on("--tor", "Use TOR") { options[:tor] = true }
end.parse!

puts "RUBY OSINT TOOLKIT v4.1".blue

results = {}

# =========================
# EXECUTION
# =========================

if options[:username]
  results[:username] = username_check(options[:username], use_tor: options[:tor])
end

if options[:domain]
  results[:dns] = dns_lookup(options[:domain])
  results[:subdomains] = subdomain_enum(options[:domain])
end

if options[:ip]
  results[:ip] = ip_lookup(options[:ip])
end

if options[:url]
  results[:emails] = email_scraper(options[:url])
end

# =========================
# OUTPUT
# =========================

if results.empty?
  puts "Use -h for help".red
  exit
end

Dir.mkdir("output") unless Dir.exist?("output")

File.write("output/report.json", JSON.pretty_generate(results))
File.write("output/report.txt", results.to_s)

generate_html(results)

puts "\nReports saved in /output".yellow
