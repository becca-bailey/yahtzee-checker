module YahtzeeChecker
  module Rules
    class SmallStraight
      include Verbalize::Action

      input :dice

      def call
        sorted = dice.sort
        straight = []
        sorted.each_with_index do |die, i|
          if die == sorted[i - 1] + 1
            straight << die
          end
        end
        fail! if straight.length < 3
        30
      end
    end
  end
end
