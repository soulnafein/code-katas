class Grid
  SIZE = 3
  def initialize
    @cells = [" "]*SIZE*SIZE
    @current_token = :O
  end

  def has_winning_line?
    has_horizontal_winning_line? ||
    has_vertical_winning_line? ||
    has_diagonal_winning_line?
  end

  def full?
    not @cells.any? { |cell| cell == " "}
  end

  def token_at(coordinate)
    @cells[coordinate.to_i]
  end

  def place_token(coordinate)

    if @cells[coordinate.to_i] == nil
      raise "coordinate overflow"
    end
    
    if @cells[coordinate.to_i] != " "
      raise "this space is already taken"
    end
    
    @cells[coordinate.to_i] = @current_token
    if @current_token == :X
      @current_token = :O
    else
      @current_token = :X
    end
  end

  def render
    separator = ""
    result = ""
    SIZE.times do |y|
      first, second, third = @cells[Coordinate.at(0,y).to_i], @cells[Coordinate.at(1,y).to_i], @cells[Coordinate.at(2,y).to_i]
      result += separator
      result += " #{first} | #{second} | #{third} \n"
      separator = "-----------\n"
    end
    return "\n" + result + "\n"
  end

  private
    def has_vertical_winning_line?
      columns.include?([:X, :X, :X]) ||
      columns.include?([:O, :O, :O])
    end

    def has_diagonal_winning_line?
      diagonals.include?([:X, :X, :X]) ||
      diagonals.include?([:O, :O, :O])
    end

    def has_horizontal_winning_line?
      rows.include?([:X, :X, :X]) ||
      rows.include?([:O, :O, :O])
    end

    def rows
      @cells.each_slice(3).to_a
    end

    def columns
      SIZE.times.map do |x|
        first, second, third = @cells[Coordinate.at(x,0).to_i], @cells[Coordinate.at(x,1).to_i], @cells[Coordinate.at(x,2).to_i]
        [first, second, third]
      end
    end

    def diagonals
      [
        [@cells[0],@cells[4],@cells[8]],
        [@cells[2],@cells[4],@cells[6]],
      ]
    end
end