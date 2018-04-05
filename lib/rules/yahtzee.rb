module YahtzeeChecker
  module Rules
    class Yahtzee
      include Verbalize::Action

      input :dice

      def call
        fail! if dice.uniq.length != 1
        ["Yahtzee", 50]
      end
    end
  end
end
