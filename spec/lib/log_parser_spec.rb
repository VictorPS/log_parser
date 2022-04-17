RSpec.describe LogParser do
  context '.most_page_views' do
    subject { LogParser.most_page_views('spec/fixtures/test_log.txt') }

    it 'list the webpages from most visited to least visited' do
      expect { subject }.to output(
        <<~TEXT
          /help_page 3 visits
          /home 1 visit
          /about/2 1 visit
        TEXT
      ).to_stdout
    end
  end
end
