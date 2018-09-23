require 'rspec'
files = Dir["lib/**/*.rb"].sort.each {|file| require File.dirname(__FILE__) + "/../" + file }


Rspec.configure do |config|
  require 'rspec/expectations'
  config.include Rspec::Matchers
  config.mock_with :rspec
end

require 'test/unit'
