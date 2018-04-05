require_relative '../spec_helper'

describe YahtzeeChecker::Rules::SmallStraight do
  context 'when it is successful' do
    it 'returns 30 points' do
      name, score = described_class.call!(dice: [1, 2, 3, 4, 6])

      expect(score).to eq 30
      expect(name).to eq "Small Straight"
    end

    it 'works for dice in any order' do
      name, score = described_class.call!(dice: [2, 4, 2, 5, 3])

      expect(score).to equal 30
    end
  end

  context 'when it fails' do
    it 'fails' do
      result = described_class.call(dice: [1, 2, 4, 4, 4])

      expect(result).to be_failed
    end
  end
end
