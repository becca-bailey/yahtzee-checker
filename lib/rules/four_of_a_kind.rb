module YahtzeeChecker
  module Rules
    class FourOfAKind
      include Verbalize::Action

      input :dice

      def call
        groups = dice.group_by(&:itself)

        groups.each do |key, value|
          if value.length >= 4
            return ["Four of a Kind", dice.reduce(:+)]
          end
        end
        fail!
      end
    end
  end
end
