#!/usr/bin/env ruby
require 'optparse'
require 'colorize'
require_relative 'modules/username'
require_relative 'utils/report'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: ruby main.rb [options]"
  opts.on("-n USERNAME", "Username OSINT") { |v| options[:username] = v }
  opts.on("--tor", "Use TOR") { options[:tor] = true }
end.parse!

puts "RUBY OSINT TOOLKIT v4.0".blue

if options[:username]
  results = username_check(options[:username], use_tor: options[:tor])
  Dir.mkdir("output") unless Dir.exist?("output")

  File.write("output/report.json", JSON.pretty_generate(results))
  File.write("output/report.txt", results.map { |r| r[:url] }.join("\n"))

  generate_html(results)

  puts "\nReports saved in /output".yellow
else
  puts "Use -h for help".red
end
