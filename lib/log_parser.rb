require 'optparse'

require_relative 'log_parser/page_visit_list'
require_relative 'log_parser/page_visit'
require_relative 'log_parser/string'
require_relative 'log_parser/decorators/page_visit_list_decorator'

class LogParser
  class << self
    def parse(arguments = [])
      options = {}

      file_path = option_parser.parse!(arguments).first

      if file_path.nil?
        puts 'You need to specify a file name'
        exit
      end

      if options[:uniq]
        uniq_most_page_views(file_path)
      else
        most_page_views(file_path)
      end
    end

    def most_page_views(file_path)
      puts PageVisitList.from_file(file_path)
                        .decorate
                        .asc_page_visit_count
    end

    def uniq_most_page_views(file_path)
      puts PageVisitList.from_file(file_path)
                        .uniq
                        .decorate
                        .asc_page_visit_count
    end

    private

    def option_parser
      @option_parser ||= OptionParser.new do |opts|
        opts.banner = 'Usage: bin/log_parser.rb [options] [file_path]'
        opts.on('--uniq', 'Ignores duplicated visits') do
          options[:uniq] = true
        end

        opts.on('-h', '--help', 'Prints this help') do
          puts opts
          exit
        end
      end
    end
  end
end
