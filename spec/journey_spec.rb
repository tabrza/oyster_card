require 'journey'

describe Journey do

  describe '#initialize' do
    context 'when initialized' do
      journey = Journey.new('aldgate', 'finchley')
      it '.current_journey return entry_station' do
          expect(journey.current_journey[:entry_station]).to eq('aldgate')
      end
      it '.current_journey return exit_station' do
        expect(journey.current_journey[:exit_station]).to eq('finchley')
      end
    end
  end

end
