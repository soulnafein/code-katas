require "spec/spec_helper"

describe TicTacToe do
  it "should create a new game" do
    @game = TicTacToe.new_game
    @game.class.should == TicTacToe
  end


  it "should tell me when a player has won" do
    game = TicTacToe.new_game

    game.start
  end
end

describe Grid do
  it "should tell me if it's full" do
    grid = Grid.new()
    grid.full?.should be_false
    grid.place_token(Coordinate.at(0, 0))
    grid.place_token(Coordinate.at(0, 1))
    grid.place_token(Coordinate.at(0, 2))
    grid.place_token(Coordinate.at(1, 0))
    grid.place_token(Coordinate.at(1, 1))
    grid.place_token(Coordinate.at(1, 2))
    grid.place_token(Coordinate.at(2, 0))
    grid.place_token(Coordinate.at(2, 1))
    grid.place_token(Coordinate.at(2, 2))

    grid.full?.should be_true
  end

  it "should tell me if it has an horizontal winning line" do
    grid = Grid.new
    grid.place_token(Coordinate.at(0, 0))
    grid.place_token(Coordinate.at(1, 1))
    grid.place_token(Coordinate.at(0, 1))
    grid.place_token(Coordinate.at(2, 2))
    grid.place_token(Coordinate.at(0, 2))

    grid.has_winning_line?.should be_true
  end

  it "should tell me if it has a vertical winning line" do
    grid = Grid.new
    grid.place_token(Coordinate.at(0, 0))
    grid.place_token(Coordinate.at(1, 1))
    grid.place_token(Coordinate.at(0, 1))
    grid.place_token(Coordinate.at(1, 2))
    grid.place_token(Coordinate.at(0, 2))

    grid.has_winning_line?.should be_true
  end

  it "should tell me if it has a diagonal winning line" do
    grid = Grid.new
    grid.place_token(Coordinate.at(0, 0))
    grid.place_token(Coordinate.at(0, 1))
    grid.place_token(Coordinate.at(1, 1))
    grid.place_token(Coordinate.at(1, 2))
    grid.place_token(Coordinate.at(2, 2))

    grid.has_winning_line?.should be_true
  end

  it "should alternate token in the grid" do
    grid = Grid.new
    grid.place_token(Coordinate.at(0,2))
    grid.token_at(Coordinate.at(0,2)).should == :O

    grid.place_token(Coordinate.at(1,1))
    grid.token_at(Coordinate.at(1,1)).should == :X

    grid.place_token(Coordinate.at(2,1))
    grid.token_at(Coordinate.at(2,1)).should == :O
  end

  it "should not place token if already taken" do
    grid = Grid.new
    grid.place_token(Coordinate.at(0,2))
    result = lambda{grid.place_token(Coordinate.at(0,2))}
    result.should raise_error "this space is already taken"
  end

  it "should not allowed overflowed coordinate" do
    grid = Grid.new
    result = lambda{grid.place_token(Coordinate.at(5,5))}
    result.should raise_error "coordinate overflow"
  end



end


