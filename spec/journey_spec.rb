require 'journey'

describe Journey do
  subject(:journey) { described_class.new }

  describe '#initialize' do
    context 'when initialized' do
      it 'should return an empty journey' do
        expect(journey.history).to eq []
      end
    end
  end

end
