require_relative '../spec_helper';

describe Yahtzee::Rules::AddNumber do
  it 'adds together the number given' do
    score = described_class.call!(dice: [1, 1, 1, 1, 2], number: 1)

    expect(score).to equal 4
  end

  it 'fails if no values match the one given' do
    result = described_class.call(dice: [1, 1, 1, 1, 2], number: 3)

    expect(result).to be_failed
  end
end

describe Yahtzee::Rules::Ones do
  it 'adds up ones' do
    score = described_class.call!(dice: [1, 1, 1, 1, 2])

    expect(score).to equal 4
  end
end

# xdescribe Yahtzee::Rules::Twos do
#   it 'adds up twos' do
#     score = described_class.call!(dice: [1, 1, 1, 2, 2])

#     expect(score).to equal 4
#   end
# end