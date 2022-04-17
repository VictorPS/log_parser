class LogParser
  class << self
    def most_page_views(file_path)
      PageVisitList
        .from_file(file_path)
        .asc_page_visit_count
    end
  end
end
