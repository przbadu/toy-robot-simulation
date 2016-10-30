require 'rspec'
require 'commands'
require 'open3'

describe 'Commands' do
  context '.invalid' do
    it {expect(simulate).to match(/Invalid command detected. Valid commands are:/)}
    it {expect(simulate('invalid')).to match(/Invalid command detected. Valid commands are:/)}
  end
end

def simulate(command='', opts='')
  stdin, stdout, stderr, wait_thr = Open3.popen3('ruby', "#{Dir.pwd}/lib/commands.rb", command, opts)
  stdout.gets
end