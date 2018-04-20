require_relative './spec_helper'
require 'game'

describe Yahtzee::Game do
    it 'returns a random roll' do
        roll = described_class.roll

        expect(roll.length).to equal 5
    end
end