require_relative '../spec_helper'

describe Yahtzee::Rules::Chance do
  context 'when it is successful' do
    it 'returns the sum of all dice' do
      score = described_class.call!(dice: [1, 1, 1, 1, 1])

      expect(score).to equal 5
    end
  end
end
