require 'lib/poker_includes.rb'

Given /^I have the following hands:$/ do |table|
  @hands = []
  table.hashes.each do |hash|
    @hands << Hand.new(hash[:hand])
  end
end

When /^I ask for the results$/ do
  poker_round = PokerRound.new(@hands)
  @results = poker_round.results
end

Then /^I should see$/ do |expected_results|
  @results.should == expected_results
end

Given /^I have the following hand "([^\"]*)"$/ do |hand|
  @hand = Hand.new(hand)
end

When /^I ask for the hand value$/ do
  @rank = @hand.rank
end

Then /^I should see "([^\"]*)"$/ do |rank|
  @rank.to_s.should == rank
end

