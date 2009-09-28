require 'lib/hand.rb'

Given /^I that I have the following hands:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending
end

When /^I ask for the results$/ do
  pending
end

Then /^I should see$/ do |string|
  pending
end

Given /^I have the following hand "([^\"]*)"$/ do |hand|
  @hand = Hand.new(hand)
end

When /^I ask for the hand value$/ do
  @score = @hand.score
end

Then /^I should see "([^\"]*)"$/ do |score|
  @score.to_s.should == score
end

