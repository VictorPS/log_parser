RSpec.describe PageVisitList do
  let(:page_visit1) { PageVisit.new(webpage: '/home', device_ip: '184.123.665.067') }
  let(:page_visit2) { page_visit1.dup }
  let(:page_visit3) { PageVisit.new(webpage: '/help_page', device_ip: '126.318.035.038') }
  let(:page_visit4) { PageVisit.new(webpage: '/home', device_ip: '126.318.035.038') }

  subject { PageVisitList.new([page_visit1, page_visit2, page_visit3, page_visit4]) }

  context '#asc_page_visit_count' do
    it 'list the webpages from most visited to least visited' do
      expect(subject.asc_page_visit_count).to eq(
        [
          ['/home', 3],
          ['/help_page', 1]
        ]
      )
    end
  end

  context '#uniq' do
    it 'returns unique page visits' do
      expect(subject.uniq.page_visits).to eq([page_visit1, page_visit3, page_visit4])
    end
  end

  context 'chaining #uniq#asc_page_visit_count' do
    it 'list unique webpages from most visited to least visited' do
      expect(subject.uniq.asc_page_visit_count).to eq(
        [
          ['/home', 2],
          ['/help_page', 1]
        ]
      )
    end
  end

  context '.from_file' do
    subject { PageVisitList.from_file('spec/fixtures/test_log.txt') }
    let(:expected_page_visit_attributes) do
      [
        { webpage: '/help_page', device_ip: '126.318.035.038' },
        { webpage: '/help_page', device_ip: '184.123.665.067' },
        { webpage: '/home', device_ip: '184.123.665.067' },
        { webpage: '/about/2', device_ip: '444.701.448.104' }
      ]
    end

    it 'loads the page_visits from a log file' do
      subject.page_visits.each_with_index do |page_visit, idx|
        expect(page_visit).to have_attributes(expected_page_visit_attributes[idx])
      end
    end
  end
end
