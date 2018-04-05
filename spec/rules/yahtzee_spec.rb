require_relative '../spec_helper'

describe YahtzeeChecker::Rules::Yahtzee do
  context 'when it is successful' do
    it 'returns 50 points' do
      score = described_class.call!(dice: [1, 1, 1, 1, 1])

      expect(score).to eq 50
    end
  end

  context 'when it fails' do
    it 'fails' do
      result = described_class.call(dice: [1, 1, 1, 1, 2])

      expect(result).to be_failed
    end
  end
end
