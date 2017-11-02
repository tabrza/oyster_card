require 'journey'
  subject(:journey) { described_class.new }
  let(:entry_station) { double(:aldgate) }
  let(:exit_station) { double(:finchley) }

describe Journey do

  describe '#initialize' do
    context 'when initialized' do
      it '.current_journey return entry_station' do
          expect(journey.current[:entry_station]).to eq('aldgate')
      end
      it '.current_journey return exit_station' do
        expect(journey.current[:exit_station]).to eq('finchley')
      end
    end
  end

  describe '#current' do
    context 'when receiving a start and end journey' do
      it 'should return the same' do
        expect(journey.current(entry_station, exit_station)).to eq [entry_station: aldgate, exit_station: finchley]
      end
    end
  end

end
