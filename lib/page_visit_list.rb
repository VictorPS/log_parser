class PageVisitList
  class << self
    def from_file(file_path)
      new(
        File.readlines(file_path).map do |line|
          webpage, device_ip = line.split(' ')
          PageVisit.new(webpage:, device_ip:)
        end
      )
    end
  end

  attr_reader :page_visits

  def initialize(page_visits = [])
    @page_visits = page_visits
  end

  def asc_page_visit_count
    page_visit_count.sort_by { |_k, v| -v }
  end

  def uniq
    self.class.new(@page_visits.uniq)
  end

  def decorate
    PageVisitListDecorator.new(self)
  end

  private

  def page_visit_count
    @page_visits.each_with_object(Hash.new(0)) do |page_visit, hash|
      hash[page_visit.webpage] += 1
    end
  end
end
