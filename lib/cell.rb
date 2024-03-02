class Cell
  attr_accessor :coordinate
  def initialize(coordinate)
    @coordinate = coordinate
  end

  def ship
    unless @cell.include?(ship)
      return false
    end
  end
end