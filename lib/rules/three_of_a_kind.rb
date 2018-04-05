module YahtzeeChecker
  module Rules
    class ThreeOfAKind
      include Verbalize::Action

      input :dice

      def call
        groups = dice.group_by(&:itself)

        groups.each do |key, value|
          if value.length >= 3
            return dice.reduce(:+)
          end
        end
        fail!
      end
    end
  end
end
