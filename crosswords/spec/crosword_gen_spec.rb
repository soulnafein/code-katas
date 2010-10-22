require 'spec_helper'

describe CrossWordGenerator do
  it "should substitute X with a massive block of hashes" do
    crossword_generator = CrossWordGenerator.new
    expected_result = "######\n" +
                      "######\n" +
                      "######\n" +
                      "######\n"

    crossword_generator.generate_from("X").should == expected_result
  end

  it "should substitute X with a massive block of hashes" do
    crossword_generator = CrossWordGenerator.new
    expected_result = "######\n" +
                      "#    #\n" +
                      "#    #\n" +
                      "######\n"

    crossword_generator.generate_from("_").should == expected_result
  end
  it "should substitute x and _ with relevant blocks for a line" do
    crossword_generator = CrossWordGenerator.new
    result =  "################\n" +
              "######    #    #\n" +
              "######    #    #\n" +
              "################\n"
    crossword_generator.generate_from("X__").should == result
  end
end