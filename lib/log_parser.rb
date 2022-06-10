require_relative 'log_parser/page_visit_list'
require_relative 'log_parser/page_visit'
require_relative 'log_parser/string'
require_relative 'log_parser/decorators/page_visit_list_decorator'

class LogParser
  class << self
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
  end
end
