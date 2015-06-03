class Robot
  attr_reader :position, :direction

  def initialize(table)
    @table = table
    @position = NullPoint.new
    @direction = NullDirection.new
  end

  def place(position, direction)
    @position = position
    @direction = direction
  end

  def move
    new_position = position.send(direction.facing)

    @position = new_position if @table.include? new_position
  end
end

class NullPoint
  def none
    self
  end
end

class NullDirection
  def facing
    :none
  end
end
