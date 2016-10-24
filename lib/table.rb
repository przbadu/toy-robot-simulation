class Table
  attr_reader :x_range,
              :y_range

  def initialize(x=5, y=5)
    @x_range = 0..(x-1)
    @y_range = 0..(y-1)
  end
end