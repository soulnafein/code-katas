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
end
