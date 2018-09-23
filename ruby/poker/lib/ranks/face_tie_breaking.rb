module FaceTieBreaking
  attr_reader :face
  
  def tie_breaking(other_pair)
    @face <=> other_pair.face
  end
end