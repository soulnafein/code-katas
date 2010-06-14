require 'rspec'

Dir["lib/**/*.rb"].sort.each {|file| require file }

Rspec.configure do |config|
  require 'rspec/expectations'
  config.include Rspec::Matchers
  config.mock_with :rspec
end
