class WordWrapper
  def initialize(max_width)
    @max_width = max_width
  end

  def wrap(text)
    return text if last_line?(text)
    this_line, rest = split_text(text)
    this_line + "\n" + rest
  end

  private
  def wrap_point(current_line)
    separators = [" ", "!", "?", ",", ";", "."]
    separator_pos = separators.map { |s| current_line.rindex(s) }.compact.max
    first_line_break = current_line.index("Z")
    first_line_break || separator_pos

  end

  def split_text(text)
    current_line = text[0..@max_width]
    wrap_point = wrap_point(current_line)
    [text[0..wrap_point].strip, text[wrap_point+1..-1].strip]
  end

  def no_spaces(text)
    text.gsub(/^[ ]*(.*)[ ]*$/, '\1')
  end

  def last_line?(text)
    text.length < @max_width
  end
end
