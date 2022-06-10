require 'delegate'

class LogParser
  class PageVisitListDecorator < SimpleDelegator
    using LogParser::String

    attr_reader :page_visit_list

    def initialize(page_visit_list)
      @page_visit_list = page_visit_list
      super
    end

    def asc_page_visit_count
      super.map do |webpage, count|
        "#{webpage} #{count} #{'visit'.pluralize(count)}"
      end
    end
  end
end
