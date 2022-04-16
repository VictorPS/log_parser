RSpec.describe LogParser do
  subject { LogParser.new('spec/fixtures/test_log.txt') }

  context '#asc_page_visit_count' do
    it 'list the webpages from most visited to least visited' do
      expect(subject.asc_page_visit_count).to eq(
        [
          ['/help_page', 2],
          ['/home', 1],
          ['/about/2', 1]
        ]
      )
    end
  end
end
