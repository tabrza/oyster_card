require 'station'
describe Station do
  subject(:station) { described_class.new('aldgate', 1) }

  describe 'attributes' do
    it '.name return station name' do
      expect(station.name).to eq('aldgate')
    end

    it '.zone return zone number' do
      expect(station.zone).to eq(1)
    end
  end

end
