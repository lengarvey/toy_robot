class Robot
  attr_accessor :position, :direction

  def initialize(table)
    @table = table
    @position = NullPoint.new
    @direction = NullDirection.new
  end

  def place(position, direction)
    if @table.include? position
      @position = position
      @direction = direction
    end
  end

  def move
    new_position = position.send(direction.facing)

    @position = new_position if @table.include? new_position
  end

  def left
    @direction = direction.left
  end

  def right
    @direction = direction.right
  end

  def report
    to_s
  end

  def to_s
    "#{position},#{direction}"
  end
end

class NullPoint
  def none
    self
  end

  def to_s
    "NO POSITION"
  end
end

class NullDirection
  def facing
    :none
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
