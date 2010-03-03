Given /^a new tic tac toe game$/ do
  start_game
end

When /^is the first turn$/ do
end

When /^is the next turn$/ do
end


Then /^I should see the following output$/ do |expected_output|
  result = get_output_text()
  result[-7..-1].should == ("\n"+expected_output+"\n").lines.to_a
end

Given /^the following moves being played:$/ do |table|
  table.hashes.each do |coord|
    x = coord["x"]
    y = coord["y"]
    @input_output.write("#{x},#{y}\n")
  end
end

When /^a token is placed at "([^\"]*)"$/ do |move|
  @input_output.write("#{move}\n") 
end

Then /^I should see "([^\"]*)"$/ do |message|
  result = get_output_text
  result[-1].should == message + "\n"
end

def get_output_text
  @input_output.write "exit\n"
  result = @input_output.readlines
  return result
end
