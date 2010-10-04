class TenthFrame < Frame
  def full?
    max_number_of_rolls = self.strike? ? 3 : 2

  end
end