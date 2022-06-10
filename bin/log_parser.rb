#!/usr/bin/env ruby

# This script reads the specified log file and shows the
# number of times each page was visited ordered by the most visited
# to the least visited page.
## Usage:
##  bin/log_parser.rb [options] [path_to_log]
## Options:
### --uniq - Ignores duplicated visits

require_relative '../lib/log_parser'
LogParser.parse(ARGV)
