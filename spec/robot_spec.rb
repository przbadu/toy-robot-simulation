require 'rspec'
require 'robot'

describe Robot do
  let(:robot) {described_class.new}

  context '.Invalid' do
    it {expect{robot.place}.to raise_error(ArgumentError)}
    it {expect{robot.place('a', 'b', 'c')}.to raise_error(InvalidCommand)}
    it {expect{robot.place('a', 'b', 'NORTH')}.to raise_error(InvalidCommand)}
    it {expect{robot.place(1, 2, 'N')}.to raise_error(InvalidCommand)}
    it {expect{robot.place(-1, 5, 'NORTH')}.to raise_error(InvalidCommand)}

    it {expect{robot.move}.to raise_error(InvalidCommand)}
    it {expect { robot.left }.to raise_error(InvalidCommand)}
    it {expect{robot.right}.to raise_error(InvalidCommand)}
    it {expect{robot.report}.to raise_error(InvalidCommand)}
  end

  context '.valid' do
    it 'example 1' do
      robot.place(0,0,'NORTH')
      robot.move
      expect(robot.report).to eq('0,1,NORTH')
    end

    it 'example 2' do
      robot.place(0,0,'NORTH')
      robot.left
      expect(robot.report).to eq('0,0,WEST')
    end

    it 'example 3' do
      robot.place(1,2,'EAST')
      robot.move
      robot.move
      robot.left
      robot.move
      expect(robot.report).to eq('3,3,NORTH')
    end

    it 'example 4' do
      robot.place(3,2,'WEST')
      robot.move
      robot.right
      robot.move
      expect(robot.report).to eq('2,3,NORTH')
    end
  end
end