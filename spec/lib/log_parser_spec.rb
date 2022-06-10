RSpec.describe LogParser do
  let(:demo_file) { 'spec/fixtures/test_log.txt' }

  context '.parse' do
    context 'default' do
      subject { LogParser.parse([demo_file]) }

      it 'calls most_page_views' do
        expect(LogParser).to receive(:most_page_views).once

        subject
      end
    end

    context 'uniq option' do
      subject { LogParser.parse(['--uniq', demo_file]) }

      it 'calls uniq_most_page_views' do
        expect(LogParser).to receive(:uniq_most_page_views).once

        subject
      end
    end
  end

  context '.most_page_views' do
    subject { LogParser.most_page_views(demo_file) }

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

  context '.uniq_most_page_views' do
    subject { LogParser.uniq_most_page_views(demo_file) }

    it 'list the unique webpages from most visited to least visited' do
      expect { subject }.to output(
        <<~TEXT
          /help_page 2 visits
          /home 1 visit
          /about/2 1 visit
        TEXT
      ).to_stdout
    end
  end
end
