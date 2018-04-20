require 'verbalize/action'

module YahtzeeChecker
  module Rules
    class AddNumber
      include Verbalize::Action

      input :dice, :number

      def call
        selected = dice.select { |n| n == number }
        fail! if selected.length == 0
        selected.reduce(:+)
      end
    end
  end
end

module YahtzeeChecker
  module Rules
    class Ones
      include Verbalize::Action

      input :dice
      
      def call
        YahtzeeChecker::Rules::AddNumber.call!(dice: dice, number: 1)
      end
    end
  end
end
