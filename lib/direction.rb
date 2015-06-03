class Direction
  class InvalidArgumentError < StandardError;end

  attr_reader :facing

  DIRECTIONS = [:north, :east, :south, :west]

  def initialize(facing)
    raise InvalidArgumentError, "#{facing} is invalid" unless valid_input_direction?(facing)

    @facing = facing
  end

  def left
    Direction.new(DIRECTIONS[DIRECTIONS.index(facing) - 1])
  end

  def right
    next_facing_index = DIRECTIONS.index(facing) + 1
    next_facing_index = 0 if next_facing_index == DIRECTIONS.length

    Direction.new(DIRECTIONS[next_facing_index])
  end

  private

  def valid_input_direction?(direction)
    Symbol === direction && DIRECTIONS.include?(direction)
  end
end
