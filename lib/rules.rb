module YahtzeeChecker
  module Rules
    class << self
      def register(*rules)
        @rules = rules
      end

      def check(*dice)
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
