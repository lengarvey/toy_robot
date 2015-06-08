class Robot
  attr_accessor :position, :direction

  def initialize(table)
    @table = table
    @position = NullPoint.new
    @direction = NullDirection.new
  end

  def place(position, direction)
    if position.is_on? @table
      @position = position
      @direction = direction
    end
  end

  def move
    new_position = position.send(direction.facing)

    @position = new_position if new_position.is_on? @table
    @position
  end

  def left
    @direction = direction.left
  end

  def right
    @direction = direction.right
  end

  def report
    puts to_s
  end

  def nothing
  end

  def to_s
    "Robot is: #{position} Facing: #{direction}"
  end
end

class NullPoint
  def nowhere
    self
  end

  def is_on?(table)
    false
  end

  def to_s
    "UNPLACED"
  end
end

class NullDirection
  def facing
    :nowhere
  end

  def left
    self
  end

  def right
    self
  end

  def to_s
    facing.to_s.upcase
  end
end
