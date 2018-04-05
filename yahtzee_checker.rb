require_relative 'lib/rules'
require_relative 'lib/rules/chance'
require_relative 'lib/rules/four_of_a_kind'
require_relative 'lib/rules/full_house'
require_relative 'lib/rules/large_straight'
require_relative 'lib/rules/small_straight'
require_relative 'lib/rules/three_of_a_kind'
require_relative 'lib/rules/yahtzee'

YahtzeeChecker::Rules.register(
  { name: "Chance", class: YahtzeeChecker::Rules::Chance },
  { name: "Four of a Kind", class: YahtzeeChecker::Rules::FourOfAKind },
  { name: "Full House", class: YahtzeeChecker::Rules::FullHouse },
  { name: "Large Straight", class: YahtzeeChecker::Rules::LargeStraight },
  { name: "Small Straight", class: YahtzeeChecker::Rules::SmallStraight },
  { name: "Three of a Kind", class: YahtzeeChecker::Rules::ThreeOfAKind },
  { name: "Yahtzee", class: YahtzeeChecker::Rules::Yahtzee },
)

dice = ARGV.map(&:to_i)

result = YahtzeeChecker::Rules.check(*dice)

result.each do |r|
  puts "#{r[:name]}: #{r[:score]}"
end


