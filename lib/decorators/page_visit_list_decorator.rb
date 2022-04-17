require 'delegate'

class PageVisitListDecorator < SimpleDelegator
  attr_reader :page_visit_list

  def initialize(page_visit_list)
    @page_visit_list = page_visit_list
    super
  end

  def asc_page_visit_count
    super.map do |webpage, count|
      "#{webpage} #{count} #{pluralize_visit(count)}"
    end
  end

  private

  def pluralize_visit(count)
    return 'visit' if count == 1

    'visits'
  end
end
