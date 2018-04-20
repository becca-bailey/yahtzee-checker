require_relative '../spec_helper'

describe Yahtzee::Rules::FourOfAKind do
  context 'when it is successful' do
    it 'returns the sum of all dice ' do
      score = described_class.call!(dice: [1, 1, 1, 1, 2])

      expect(score).to equal 6
    end

    it 'works for dice in any order' do
      score = described_class.call!(dice: [2, 2, 2, 2, 3])

      expect(score).to equal 11
    end
  end

  context 'when it fails' do
    it 'fails without four of a kind' do
      result = described_class.call(dice: [1, 2, 2, 2, 3])

      expect(result).to be_failed
    end
  end
end
