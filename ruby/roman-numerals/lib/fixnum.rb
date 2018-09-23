class Fixnum
  def decompose(position=0)
    other_digits, current_digit = self.divmod(10)
    result = [current_digit*(10**position)]
    return result if other_digits == 0
    return result + other_digits.decompose(position+1)
  end

  def to_roman
    roman_numerals_patterns = ["", "0", "00", "000", "01", "1", "10", "100", "1000", "02"]
    numerals_groups = [
      ["I", "V", "X"], ["X", "L", "C"], ["C", "D", "M"],["M", "(V)", "(X)"],
      ["(X)", "(L)", "(C)"], ["(C)", "(D)", "(M)"], ["(M)", "((V))", "((X))"]]

    result = ""
    self.decompose.each_with_index do |number, i|
      pattern = roman_numerals_patterns[number/10**i]
      numeral_group = numerals_groups[i]
      result = pattern.gsub(/\d/) { |n| numeral_group[n.to_i] } + result
    end
    result
  end
end