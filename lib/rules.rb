module YahtzeeChecker
  module Rules
    class << self
      def register(*rules)
        @rules = rules
      end

      def check(*dice)
        scores = []
        @rules.each do |rule|
          result = rule.call(dice: dice)
          next if result.failed? 
          name, score = result.value
          scores << { name: name, score: score }
        end
        scores.sort_by { |s| -s[:score] }
      end
    end
  end
end
