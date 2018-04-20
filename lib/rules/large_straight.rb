module Yahtzee
  module Rules
    class LargeStraight
      include Verbalize::Action

      input :dice

      def call
        sorted = dice.sort
        if sorted.each_cons(2).all? {|a, b| b == a + 1 }
          40
        else
          fail!
        end
      end
    end
  end
end
