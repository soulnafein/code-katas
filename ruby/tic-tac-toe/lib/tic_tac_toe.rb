require 'grid'
require 'coordinate'

class TicTacToe
  def initialize
    @current_player = "Player 1"
  end

  def self.new_game()
    TicTacToe.new
  end

  def show_grid(grid)
    puts grid.render
  end

  def display_message(message)
    puts message
  end

  def start
    grid = Grid.new
    show_grid(grid)
    while true do
      move = get_next_move
      grid.place_token(move)
      show_grid(grid)
      display_message "#{@current_player} won!" if grid.has_winning_line?
      display_message "Draw!" if grid.full?
      new_turn
    end
  end



  private
    def get_next_move
      move = gets
       if move == "exit\n"
         exit
       end
      Coordinate.at(move.chars.to_a[0].to_i, move.chars.to_a[2].to_i)
    end

    def new_turn
      if @current_player == "Player 1"
        @current_player = "Player 2"
      else
        @current_player = "Player 1"
      end
    end
end


