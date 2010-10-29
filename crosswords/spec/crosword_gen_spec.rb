require 'spec_helper'

describe CrossWordGenerator do
  it "should substitute x and _ with relevant blocks for a line" do
    crossword_generator = CrossWordGenerator.new
    result =  "#####################\n" +
              "#    ######    #    #\n" +
              "#    ######    #    #\n" +
              "#####################\n"
    crossword_generator.generate_from("_X__").should == result
  end

  it "should process multiline input" do
    crossword_generator = CrossWordGenerator.new
    result =  "################\n" +
              "######    #    #\n" +
              "######    #    #\n" +
              "################\n" +
              "#    ######    #\n" +
              "#    ######    #\n" +
              "################\n"
    crossword_generator.generate_from("X__\n_X_").should == result
  end

  it "should remove filled blocks from the outside of the crossword" do
    crossword_generator = CrossWordGenerator.new
    result =  "################\n" +
              "######    ######\n" +
              "######    ######\n" +
              "################\n" +
              "#    #    #    #\n" +
              "#    #    #    #\n" +
              "################\n"
    crossword_generator.generate_from("X_X\n___").should == result
  end
end