require_relative './table'
require_relative './exception'

class Robot
  attr_accessor :x_position, :y_position, :facing
  attr_reader :table

  def initialize(table=Table.new)
    @table = table
    @directions = %w(NORTH EAST SOUTH WEST)
  end

  def place(x, y, f)
    raise InvalidCommand.new unless valid_position?(x, y) && valid_direction?(f)

    @x_position = x.to_i
    @y_position = y.to_i
    @facing = f
  end

  def move
    raise InvalidCommand.new unless placed?

    case @facing
      when 'NORTH'
        check_movement(@y_position+1, @table.y_range)
        @y_position += 1
      when 'SOUTH'
        check_movement(@y_position-1, @table.y_range)
        @y_position -= 1
      when 'EAST'
        check_movement(@x_position+1, @table.x_range)
        @x_position += 1
      when 'WEST'
        check_movement(@x_position-1, @table.x_range)
        @x_position -= 1
    end
  end

  def left
    raise InvalidCommand.new unless placed?

    new_facing = if current_facing_index == 0
                   @directions.last
                 else
                   @directions[current_facing_index - 1]
                 end
    @facing = new_facing
  end

  def right
    raise InvalidCommand.new unless placed?

    new_facing = if current_facing_index == @directions.size - 1
                   @directions.first
                 else
                   @directions[current_facing_index + 1]
                 end
    @facing = new_facing
  end

  def report
    raise InvalidCommand.new unless placed?
    "#{@x_position},#{@y_position},#{@facing}"
  end

  private

  def placed?
    !!@facing
  end

  def current_facing_index
    @directions.find_index(@facing)
  end

  def check_movement(current_pos, range)
    raise InvalidCommand.new('Invalid input, robot will fall from the table') unless range === current_pos
  end

  def valid_position?(x_position, y_position)
    (@table.x_range === x_position.to_i) &&
        (@table.y_range === y_position.to_i)
  end

  def valid_direction?(direction)
    @directions.include?(direction)
  end
end