require "rspec"
require File.dirname(__FILE__) + '/../lib/word_wrapper'

describe WordWrapper do
  it "should break line before word that trepasses max width" do
    text = "xxx xxx"+"xx xx"
    wrapper = WordWrapper.new(7)
    wrapper.wrap(text).should == "xxx\nxxxxx\nxx"
  end

  it "should break after word that fits exactly in max width" do
    text = "xxx xxx"+" xxx"
    wrapper = WordWrapper.new(7)
    wrapper.wrap(text).should == "xxx xxx\nxxx"
  end

  it "should not include the space at the end of max line" do
    text = "xxx xx "+"xxx"
    wrapper = WordWrapper.new(7)
    wrapper.wrap(text).should == "xxx xx\nxxx"
  end

  it "should manage correctly existing line breaks" do
    text = "xxx xxx"+" xxx\nxx\n"+"\nxxx"
    wrapper = WordWrapper.new(7)
    wrapper.wrap(text).should == "xxx xxx\nxxx\nxx\n\nxxx"
  end

  it "should break on punctuation like ,;.!?" do
    text = "xxx xx," + "xxxxx x"+"x! xxx!"
    wrapper = WordWrapper.new(7)
    wrapper.wrap(text).should == "xxx xx,\nxxxxx\nxx!xxx!"
  end

  context "When wrapping lorem ipsum" do
    it "should wrap correctly" do
      wrapper = WordWrapper.new(145)
      text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc varius fermentum orci, eu blandit risus consequat ac. Curabitur ligula neque, malesuada tristique mollis non, feugiat vitae tellus. Nam tellus massa, mattis ut malesuada at, laoreet eget turpis. Donec vel turpis quis felis sollicitudin molestie non interdum dolor. Suspendisse potenti. In suscipit, lectus nec blandit egestas, enim sapien convallis nunc, eget condimentum justo urna vel sapien. Nunc pulvinar lacinia scelerisque. Aliquam ut eros nibh, vitae vulputate enim. Maecenas lectus nulla, dapibus gravida vehicula iaculis, convallis sed neque. Proin et metus vitae enim gravida lacinia eget non nibh. Nulla lobortis, turpis eget porta consectetur, risus erat pellentesque risus, nec accumsan leo purus vitae arcu. Aliquam erat volutpat. Sed eget orci porta est pretium consequat nec in urna. Nulla nec purus nec mi mattis consectetur sed at quam.\nLorem ipsum dolor sit amet."
      expected = """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc varius fermentum orci, eu blandit risus consequat ac. Curabitur ligula neque,
malesuada tristique mollis non, feugiat vitae tellus. Nam tellus massa, mattis ut malesuada at, laoreet eget turpis. Donec vel turpis quis felis
sollicitudin molestie non interdum dolor. Suspendisse potenti. In suscipit, lectus nec blandit egestas, enim sapien convallis nunc, eget
condimentum justo urna vel sapien. Nunc pulvinar lacinia scelerisque. Aliquam ut eros nibh, vitae vulputate enim. Maecenas lectus nulla, dapibus
gravida vehicula iaculis, convallis sed neque. Proin et metus vitae enim gravida lacinia eget non nibh. Nulla lobortis, turpis eget porta
consectetur, risus erat pellentesque risus, nec accumsan leo purus vitae arcu. Aliquam erat volutpat. Sed eget orci porta est pretium consequat
nec in urna. Nulla nec purus nec mi mattis consectetur sed at quam.
Lorem ipsum dolor sit amet."""
      wrapper.wrap(text).should == expected
    end
  end
end

