require_relative './robot'
require_relative './exception'

class CommandParser
  attr_reader :robot

  def initialize(argv,out=STDOUT)
    @robot=Robot.new
    command = argv[0]

    case command
      when 'PLACE'
        raise InvalidCommand.new if argv[1].nil?
        x, y, facing = argv[1].split(',')
        @robot.send('place', x, y, facing)
      when 'LEFT', 'RIGHT', 'MOVE', 'REPORT'
        @robot.send(command.downcase)
      else
        out.puts "Invalid command detected. Valid commands are:\n  PLACE X,Y,F\n  MOVE\n  LEFT\n  RIGHT\n  REPORT"
    end
  end
end