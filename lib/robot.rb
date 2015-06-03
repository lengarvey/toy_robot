class Robot
  attr_reader :position, :facing

  def place(position, facing)
    @position = position
    @facing = facing
  end
end
