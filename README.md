# Yahtzee Checker

A Ruby-based tool that helps you score your Yahtzee rolls by checking all possible scoring combinations for a given set of dice.

## Features

- Checks all standard Yahtzee scoring combinations:
  - Chance
  - Four of a Kind
  - Full House
  - Large Straight
  - Small Straight
  - Three of a Kind
  - Yahtzee
- Simple command-line interface
- Comprehensive test suite

## Requirements

- Ruby 3.2.2 or later
- Bundler

## Installation

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd yahtzee-checker
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

## Usage

Run the Yahtzee checker by providing 5 dice values as command-line arguments:

```bash
ruby yahtzee_checker.rb <dice1> <dice2> <dice3> <dice4> <dice5>
```

### Example

```bash
ruby yahtzee_checker.rb 1 2 3 4 5
```

Output:

```
Large Straight: 40
Small Straight: 30
Chance: 15
```

## Testing

Run the test suite to verify everything is working correctly:

```bash
bundle exec rspec
```

## Scoring Rules

- **Chance**: Sum of all dice
- **Three of a Kind**: Sum of all dice if at least three dice are the same
- **Four of a Kind**: Sum of all dice if at least four dice are the same
- **Full House**: 25 points if you have three of one number and two of another
- **Small Straight**: 30 points for four sequential numbers
- **Large Straight**: 40 points for five sequential numbers
- **Yahtzee**: 50 points if all five dice are the same

## License

[Add your license information here]
