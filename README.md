# About
This is a ruby script that reads a log file and prints out the number of times each page was visited ordered by the most visited page to the least visited page.

# Setup
This project was built using `ruby 3.1.1` and before you run the script you need to install the gems.
```
bundle install
```

# Usage
```
bin/log_parser.rb [options] [path_to_log]
```
Possible options:
- --uniq - Ignores duplicated visits

## Example
Executing `bin/log_parser.rb logs/webserver.txt` returns:

```
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
```

# Testing
```
bundle exec rspec
```
