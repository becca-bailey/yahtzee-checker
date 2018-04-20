require_relative 'lib/rules'
require_relative 'lib/rules/chance'
require_relative 'lib/rules/four_of_a_kind'
require_relative 'lib/rules/full_house'
require_relative 'lib/rules/large_straight'
require_relative 'lib/rules/small_straight'
require_relative 'lib/rules/three_of_a_kind'
require_relative 'lib/rules/yahtzee'
require_relative 'lib/rules/add_number'

Yahtzee::Rules.register(
  { name: "Chance", class: Yahtzee::Rules::Chance },
  { name: "Four of a Kind", class: Yahtzee::Rules::FourOfAKind },
  { name: "Full House", class: Yahtzee::Rules::FullHouse },
  { name: "Large Straight", class: Yahtzee::Rules::LargeStraight },
  { name: "Small Straight", class: Yahtzee::Rules::SmallStraight },
  { name: "Three of a Kind", class: Yahtzee::Rules::ThreeOfAKind },
  { name: "Yahtzee", class: Yahtzee::Rules::Yahtzee },
  { name: "Ones", class: Yahtzee::Rules::Ones },
)

dice = ARGV.map(&:to_i)

result = Yahtzee::Rules.check(*dice)

result.each_with_index do |r, i|
  n = i + 1
  puts "(#{n}) #{r[:name]}: #{r[:score]}"
end


