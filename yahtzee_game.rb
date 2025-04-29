require_relative 'lib/rules'
require_relative 'lib/rules/chance'
require_relative 'lib/rules/four_of_a_kind'
require_relative 'lib/rules/full_house'
require_relative 'lib/rules/large_straight'
require_relative 'lib/rules/small_straight'
require_relative 'lib/rules/three_of_a_kind'
require_relative 'lib/rules/yahtzee'

class YahtzeeGame
  def initialize
    @scorecard = {
      "Ones" => nil,
      "Twos" => nil,
      "Threes" => nil,
      "Fours" => nil,
      "Fives" => nil,
      "Sixes" => nil,
      "Three of a Kind" => nil,
      "Four of a Kind" => nil,
      "Full House" => nil,
      "Small Straight" => nil,
      "Large Straight" => nil,
      "Yahtzee" => nil,
      "Chance" => nil
    }
    @round = 1
    @rolls_remaining = 3
    @current_dice = []
  end

  def start
    puts "Welcome to Yahtzee!"
    puts "You have 13 rounds to fill your scorecard."
    puts "Each round you can roll up to 3 times."
    puts "After each roll, you can choose which dice to keep."
    puts "At the end of each round, you must choose a category to score."
    puts "\nPress Enter to start..."
    gets&.chomp

    while @round <= 13
      play_round
      @round += 1
    end

    show_final_score
  end

  private

  def play_round
    @rolls_remaining = 3
    @current_dice = []
    keepers = []

    while @rolls_remaining > 0
      roll_dice(keepers)
      show_dice
      
      if @rolls_remaining > 0
        puts "\nWhich dice would you like to keep? (Enter numbers 1-5, separated by spaces)"
        puts "Or press Enter to roll all dice again"
        input = gets&.chomp || ""
        keepers = input.split.map(&:to_i).map { |i| i - 1 }
      end
    end

    score_round
  end

  def roll_dice(keepers)
    @rolls_remaining -= 1
    new_dice = Array.new(5) { rand(1..6) }
    
    keepers.each do |i|
      new_dice[i] = @current_dice[i] if @current_dice[i]
    end
    
    @current_dice = new_dice
  end

  def show_dice
    puts "\nRoll ##{3 - @rolls_remaining}:"
    @current_dice.each_with_index do |die, i|
      puts "Die #{i + 1}: #{die}"
    end
  end

  def score_round
    available_categories = get_available_categories

    loop do
      # Display available categories with scores
      puts "\nAvailable scoring options:"
      available_categories.each do |option|
        puts "#{option[:index]}. #{option[:category]}: #{option[:score]} points"
      end

      puts "\nEnter the number of the category you want to score:"
      choice = gets&.chomp&.to_i

      if choice&.between?(1, available_categories.length)
        selected = available_categories[choice - 1]
        @scorecard[selected[:category]] = selected[:score]
        puts "Scored #{selected[:score]} points in #{selected[:category]}!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def get_available_categories
    available_categories = []
    index = 1

    # Check upper section
    (1..6).each do |number|
      category = number == 1 ? "Ones" : "#{number}s"
      if @scorecard[category].nil?
        score = @current_dice.select { |d| d == number }.sum
        available_categories << { index: index, category: category, score: score }
        index += 1
      end
    end

    # Check lower section
    lower_section = {
      "Three of a Kind" => YahtzeeChecker::Rules::ThreeOfAKind,
      "Four of a Kind" => YahtzeeChecker::Rules::FourOfAKind,
      "Full House" => YahtzeeChecker::Rules::FullHouse,
      "Small Straight" => YahtzeeChecker::Rules::SmallStraight,
      "Large Straight" => YahtzeeChecker::Rules::LargeStraight,
      "Yahtzee" => YahtzeeChecker::Rules::Yahtzee,
      "Chance" => YahtzeeChecker::Rules::Chance
    }

    lower_section.each do |category, rule_class|
      if @scorecard[category].nil?
        result = rule_class.call(dice: @current_dice)
        score = result.failed? ? 0 : result.value
        available_categories << { index: index, category: category, score: score }
        index += 1
      end
    end

    available_categories
  end

  def show_final_score
    puts "\nFinal Scorecard:"
    total = 0
    @scorecard.each do |category, score|
      puts "#{category}: #{score || 0}"
      total += score if score
    end
    puts "\nTotal Score: #{total}"
  end
end

# Start the game
game = YahtzeeGame.new
game.start 