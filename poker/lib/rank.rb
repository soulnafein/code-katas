class Rank
  def initialize(description)
    @description = description
  end

  def to_s
    @description
  end

  include Comparable

  def <=>(other)
    if self.instance_of? other.class
      tie_breaking(other)
    else
      value <=> other.value
    end       
  end

  def tie_breaking(other)
    0
  end
end
