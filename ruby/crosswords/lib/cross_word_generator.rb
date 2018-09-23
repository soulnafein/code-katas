class CrossWordGenerator
  def generate_from(input)
    result = ""
    is_first_line = true
    input.each_line do |line|
      #line = line.gsub(/^[X]*/) { |s| "A"*s.size}
      result << print_horizontal_border(line.strip) if is_first_line
      result << print_center(line.strip)
      result << print_center(line.strip)
      result << print_horizontal_border(line.strip)
      is_first_line = false
    end
    result
  end

  private
  BUILDING_BLOCKS_CENTER = { "X" => "######", "_" => "#    #", "A" => "      "}
  BUILDING_BLOCKS_BORDER = { "X" => "######", "_" => "######", "A" => "      "}
  def print_center_block(type)
    BUILDING_BLOCKS_CENTER[type]
  end

  def print_border_block(type)
    BUILDING_BLOCKS_BORDER[type]
  end

  def print_center(input)
    result = ""
    input.each_char do |char|
      result = result[0..-2] + print_center_block(char)
    end
    result + "\n"
  end

  def print_horizontal_border(input)
    result = ""
    input.each_char do |char|
      result = result[0..-2] + print_border_block(char)
    end
    result + "\n"
  end
end