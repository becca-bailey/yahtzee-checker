require_relative '../spec_helper'

describe YahtzeeChecker::Rules::LargeStraight do
  context 'when it is successful' do
    it 'returns 40 points' do
      name, score = described_class.call!(dice: [1, 2, 3, 4, 5])

      expect(score).to equal 40
      expect(name).to eq "Large Straight"
    end

    it 'works for dice in any order' do
      name, score = described_class.call!(dice: [2, 4, 6, 3, 5])

      expect(score).to equal 40
    end
  end

  context 'when it fails' do
    it 'fails' do
      result = described_class.call(dice: [1, 2, 3, 4, 4])

      expect(result).to be_failed
    end
  end
end
