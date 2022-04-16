require_relative '../../lib/log_parser'

RSpec.describe LogParser do
  subject { LogParser.new('spec/fixtures/test_log.txt') }

  context '#ordered_list' do
    it 'list the webpages from most visited to least visited' do
      expect(subject.ordered_list).to eq(
        [
          ['/help_page', 2],
          ['/home', 1],
          ['/about/2', 1]
        ]
      )
    end
  end
end
