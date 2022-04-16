require_relative '../../lib/page_visit'

RSpec.describe PageVisit do
  subject { PageVisit.new(webpage: '/home', device_ip: '184.123.665.067') }

  it 'has a webpage' do
    expect(subject.webpage).to eq('/home')
  end

  it 'has a device_ip' do
    expect(subject.device_ip).to eq('184.123.665.067')
  end
end
