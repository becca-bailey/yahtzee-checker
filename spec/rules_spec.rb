require 'spec_helper'

describe YahtzeeChecker::Rules do
  before do
    described_class.register(
      { name: "Full House", class: YahtzeeChecker::Rules::FullHouse },
      { name: "Chance", class: YahtzeeChecker::Rules::Chance },
      { name: "Yahtzee", class: YahtzeeChecker::Rules::Yahtzee },
    )
  end

  describe '#check' do
    it 'returns the name and score of any matching rules ranked by score' do
      expect(described_class.check(1, 1, 1, 1, 1)).to eq(
        [
          { name: "Yahtzee", score: 50 },
          { name: "Chance", score: 5 },
        ]
      )
    end
  end
end
