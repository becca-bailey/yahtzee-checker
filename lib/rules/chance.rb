module YahtzeeChecker
  module Rules
    class Chance
      include Verbalize::Action

      input :dice

      def call
        ["Chance", dice.reduce(:+)]
      end
    end
  end
end
