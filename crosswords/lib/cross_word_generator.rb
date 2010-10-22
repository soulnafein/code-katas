class CrossWordGenerator
  def generate_from(input)
    print_horizontal_border(input) +
    print_center(input) +
    print_center(input) +
    print_horizontal_border(input)
  end

  private
  def print_block(type)
    if type == "X"
      "######"
    else
      "#    #"
    end
  end

  def print_center(input)
    result = ""
    input.each_char do |char|
      result = result[0..-2] + print_block(char)
    end
    result + "\n"
  end

  def print_horizontal_border(input)
    number_of_characters_to_print = input.size * 6 - (input.size-1)
    result = ""
    number_of_characters_to_print.times do
      result << "#"
    end
    result + "\n"
  end
end