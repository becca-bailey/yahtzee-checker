require_relative '../spec_helper'

describe Yahtzee::Rules::FullHouse do
  context 'when it is successful' do
    it 'returns 25 points' do
      score = described_class.call!(dice: [1, 1, 1, 2, 2])

      expect(score).to equal 25
    end

    it 'works for dice in any order' do
      score = described_class.call!(dice: [2, 3, 2, 2, 3])

      expect(score).to equal 25
    end
  end

  context 'when it fails' do
    it 'fails with more than 2 values' do
      result = described_class.call(dice: [1, 1, 2, 2, 3])

      expect(result).to be_failed
    end

    it 'fails with the wrong number of values' do
      result = described_class.call(dice: [1, 1, 1, 1, 2])

      expect(result).to be_failed
    end
  end
end
