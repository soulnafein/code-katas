require "spec/spec_helper"

describe TicTacToe do
  it "should create a new game" do
    @game = TicTacToe.new_game
    @game.class.should == TicTacToe
  end
end

describe Grid do
  it "should tell me if it's full" do
    grid = Grid.new()
    grid.full?.should be_false
    grid.place_token(Coordinate.at(0,0))
    grid.place_token(Coordinate.at(0,1))
    grid.place_token(Coordinate.at(0,2))
    grid.place_token(Coordinate.at(1,0))
    grid.place_token(Coordinate.at(1,1))
    grid.place_token(Coordinate.at(1,2))
    grid.place_token(Coordinate.at(2,0))
    grid.place_token(Coordinate.at(2,1))
    grid.place_token(Coordinate.at(2,2))

    grid.full?.should be_true
  end

  it "should tell me if it has top horizontal winning line" do
    grid = Grid.new()
    grid.place_token(Coordinate.at(0,0))
    grid.place_token(Coordinate.at(1,1))
    grid.place_token(Coordinate.at(0,1))
    grid.place_token(Coordinate.at(2,2))
    grid.place_token(Coordinate.at(0,2))
    grid.place_token(Coordinate.at(1,3))

    grid.has_winning_line?.should be_true
  end
  
end


