#!/usr/bin/env ruby

# This script reads the specified log file and shows the
# number of times each page was visited ordered by the most visited
# to the least visited page.
## Usage:
##  bin/log_parser.rb [options] [path_to_log]
## Options:
### --uniq - Ignores duplicated visits

require_relative '../lib/log_parser'
require 'optparse'

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = 'Usage: bin/log_parser.rb [options] [file_path]'
  opts.on('--uniq', 'Ignores duplicated visits') do
    options[:uniq] = true
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end
end

file_path = opt_parser.parse!(ARGV).first

if file_path.nil?
  puts 'You need to specify a file name'
  exit
end

if options[:uniq]
  LogParser.uniq_most_page_views(file_path)
else
  LogParser.most_page_views(file_path)
end
