module Yahtzee
  module Rules
    class << self
      def register(*rules)
        @rules = rules
      end

      def check(*dice)
        raise "Please provide five values" if dice.length != 5
        if dice.any? { |value| value < 1 || value > 6 }
          raise "Values must be between 1 and 6"
        end
        scores = []
        @rules.each do |rule|
          result = rule[:class].call(dice: dice)
          next if result.failed? 
          score = result.value
          scores << { name: rule[:name], score: score }
        end
        scores.sort_by { |s| -s[:score] }
      end
    end
  end
end
