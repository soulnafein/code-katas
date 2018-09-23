require 'spec/spec_helper.rb'

describe Face do
  it "should be equal to a face with same value" do
    face_1 = Face.parse("K")
    face_2 = Face.parse("K")
    face_3 = Face.parse("T")

    face_1.should == face_2
    face_3.should_not == face_1
  end 

  it "should be printable" do
    face_1 = Face.parse("K")       
    face_1.to_s.should == "K"
  end
  
   it "should be lower than a face with higher value" do
    Face::KING.should > Face::TEN
    Face::EIGHT.should < Face::TEN
  end

  it "should find a face based on a character" do
    Face.parse("K").should == Face::KING
    Face.parse("k").should == Face::KING
  end

  it "should complain if it can't parse a face" do
    lambda {Face.parse("10")}.should raise_error(UnknownFaceError)
  end

  it "should give me a list of all the faces" do
    all_faces = Face.all_faces
    all_faces.length.should == 13
    all_faces.sort.reverse.should == all_faces
  end
end
