require 'verbalize/action'

module YahtzeeChecker
  module Rules
    class Chance
      include Verbalize::Action

      input :dice

      def call
        dice.reduce(:+)
      end
    end
  end
end
