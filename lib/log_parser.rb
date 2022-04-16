require 'forwardable'

class LogParser
  extend Forwardable

  attr_reader :log_path

  def_delegators :page_visit_list, :asc_page_visit_count

  def initialize(log_path)
    @log_path = log_path
  end

  private

  def page_visit_list
    @page_visit_list ||= PageVisitList.new(
      File.readlines(log_path).map do |line|
        webpage, device_ip = line.split(' ')
        PageVisit.new(webpage:, device_ip:)
      end
    )
  end
end
