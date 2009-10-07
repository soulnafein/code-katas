class Rank
  def initialize(description)
    @description = description
  end

  def to_s
    @description
  end

  include Comparable

  def <=>(other)
    value <=> other.value
  end
end
