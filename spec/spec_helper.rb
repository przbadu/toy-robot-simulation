require 'rspec'

Dir[File.join(File.dirname(__FILE__), '../lib/**/*.rb')].each do |file|
  require file
end

Rspec.configure do |config|
  config.order = 'random'
end