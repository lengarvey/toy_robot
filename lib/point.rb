class Point
  class InvalidArgumentError < StandardError;end

  attr_reader :x, :y

  def initialize(x, y)
    raise InvalidArgumentError, "#{x} must be a non-negative integer" unless Fixnum === x && x >= 0
    raise InvalidArgumentError, "#{y} must be a non-negative integer" unless Fixnum === y && y >= 0

    @x = x
    @y = y
  end

  def north
    Point.new(@x, @y += 1)
  end

  def south
    Point.new(@x, @y += -1)
  end

  def east
    Point.new(@x += 1, @y)
  end

  def west
    Point.new(@x += -1, @y)
  end
end
