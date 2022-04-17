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
