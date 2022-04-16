RSpec.describe PageVisit do
  subject { PageVisit.new(webpage: '/home', device_ip: '184.123.665.067') }

  it 'has a webpage' do
    expect(subject.webpage).to eq('/home')
  end

  it 'has a device_ip' do
    expect(subject.device_ip).to eq('184.123.665.067')
  end

  context '#eql?' do
    context 'another page_visit with different device_ip' do
      let(:other_page_visit) { PageVisit.new(webpage: '/home', device_ip: '184.123.111.111') }

      it 'returns false' do
        expect(subject.eql?(other_page_visit)).to be_falsey
      end
    end

    context 'another page_visit with different webpage' do
      let(:other_page_visit) { PageVisit.new(webpage: '/other', device_ip: '184.123.665.067') }

      it 'returns false' do
        expect(subject.eql?(other_page_visit)).to be_falsey
      end
    end

    context 'another page_visit with the same attributes' do
      let(:other_page_visit) { subject.dup }

      it 'returns true' do
        expect(subject.eql?(other_page_visit)).to be_truthy
      end
    end
  end
end
