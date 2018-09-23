require "spec/spec_helper"

describe UserInterface do
  context "When asking a question" do
    before :each do
      @ui = UserInterface.new
      @ui.stub!(:gets)
    end

    it "should display the question" do
      @ui.should_receive(:puts).with("What's your name?").once
      @ui.ask_question("What's your name?")
    end

    it "should read the answer typed by the user" do
      @ui.should_receive(:gets).and_return("David")

      answer = @ui.ask_question("What's your name?")

      answer.should == "David"
    end

  end
end