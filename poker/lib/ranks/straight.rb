class Straight < Rank
  def initialize(face)
    super("Straight", 5)
    @face = face
  end

  def self.find_in hand
    all_possible_straights.each do |straight|
      has_straight = hand.contains_faces?(straight)
      return Straight.new(straight.first) if has_straight
    end
  end

  include FaceTieBreaking
  
  private
  def self.all_possible_straights(&block)
    all_faces_with_lower_ace = Face.all_faces << Face::ACE
    all_faces_with_lower_ace.each_cons(5, &block)
  end
end
