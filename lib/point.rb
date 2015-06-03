class Point
  class InvalidArgumentError < StandardError;end

  attr_accessor :x, :y

  def initialize(x, y)
    raise InvalidArgumentError, "#{x} must be a non-negative integer" unless Fixnum === x && x >= 0
    raise InvalidArgumentError, "#{y} must be a non-negative integer" unless Fixnum === y && y >= 0

    @x = x
    @y = y
  end
end
