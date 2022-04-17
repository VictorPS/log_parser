RSpec.describe LogParser do
  context '.most_page_views' do
    subject { LogParser.most_page_views('spec/fixtures/test_log.txt') }

    it 'list the webpages from most visited to least visited' do
      expect(subject).to eq(
        [
          ['/help_page', 2],
          ['/home', 1],
          ['/about/2', 1]
        ]
      )
    end
  end
end
