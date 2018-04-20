module Yahtzee
  module Rules
    class FullHouse
      include Verbalize::Action

      input :dice

      def call
        groups = dice.group_by(&:itself)

        if groups.length > 2
          fail!
        end

        groups.each do |key, value|
          if value.length != 2 && value.length != 3
            fail!
          end
        end

        25
      end
    end
  end
end
