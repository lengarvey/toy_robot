class Table
  def initialize
    @height = 5
    @width = 5
  end

  def include?(point)
    point.x < @width && point.y < @height
  end
end
