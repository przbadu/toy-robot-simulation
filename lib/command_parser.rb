require_relative './robot'
require_relative './exception'

class CommandParser
  attr_reader :robot

  def initialize(argv,out=STDOUT)
    @robot=Robot.new

    @index = 0

    while @index < argv.length
      case command = argv[@index]
        when 'PLACE'
          x, y, facing = argv[@index+1].split(',')
          @robot.send('place', x, y, facing)
          @index += 2
        when 'LEFT', 'RIGHT', 'MOVE'
          @robot.send(command.downcase)
          @index += 1
        when 'REPORT'
          puts @robot.report
          @index += 1
        else
          raise InvalidCommand.new "Invalid command detected. Valid commands are:\n  PLACE X,Y,F\n  MOVE\n  LEFT\n  RIGHT\n  REPORT"
      end
    end
  end
end