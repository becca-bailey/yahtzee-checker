require 'spec_helper'

describe Yahtzee::Rules do
  before do
    described_class.register(
      { name: "Full House", class: Yahtzee::Rules::FullHouse },
      { name: "Chance", class: Yahtzee::Rules::Chance },
      { name: "Yahtzee", class: Yahtzee::Rules::Yahtzee },
      { name: "Ones", class: Yahtzee::Rules::Ones },
    )
  end

  describe '#check' do
    it 'returns the name and score of any matching rules ranked by score' do
      expect(described_class.check(1, 1, 1, 1, 1)).to eq(
        [
          { name: "Yahtzee", score: 50 },
          { name: "Chance", score: 5 },
          { name: "Ones", score: 5 },
        ]
      )
    end

    it 'throws an exception if the number of values is not equal to 5' do
      expect{described_class.check(1, 2, 3, 4, 5, 6)}.to raise_error(RuntimeError)
    end

    it 'throws an exception if any dice are greater than 6' do
      expect{described_class.check(1, 1, 1, 1, 7)}.to raise_error(RuntimeError)
    end

    it 'throws an exception if any dice are greater than 6' do
      expect{described_class.check(1, 1, 1, 1, 0)}.to raise_error(RuntimeError)
    end
  end
end
