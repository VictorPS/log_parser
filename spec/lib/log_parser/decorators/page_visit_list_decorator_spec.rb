RSpec.describe LogParser::PageVisitListDecorator do
  subject { LogParser::PageVisitListDecorator.new(page_visit_list) }
  let(:page_visit1) { LogParser::PageVisit.new(webpage: '/home', device_ip: '184.123.665.067') }
  let(:page_visit2) { page_visit1.dup }
  let(:page_visit3) { LogParser::PageVisit.new(webpage: '/help_page', device_ip: '126.318.035.038') }
  let(:page_visit4) { LogParser::PageVisit.new(webpage: '/home', device_ip: '126.318.035.038') }
  let(:page_visit_list) { LogParser::PageVisitList.new([page_visit1, page_visit2, page_visit3, page_visit4]) }

  describe '#asc_page_visit_count' do
    it 'returns a formatted list of the visited pages ordered by most visited' do
      expect(subject.asc_page_visit_count).to eq(
        [
          '/home 3 visits',
          '/help_page 1 visit'
        ]
      )
    end
  end
end
