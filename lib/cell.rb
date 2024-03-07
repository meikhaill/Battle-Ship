class Cell
  attr_accessor :coordinate, :empty, :fired
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @empty = true
    @fired = false
  end

  def ship
    @ship
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
    @fired = false
    return ship
  end

  def fired_upon?
    @fired
  end

  def fire_upon
    if @ship
      @ship.hit
      @fired = true
      @ship
    end
    @fired = true
  end

  def render(show_ship = false)
    if self.fired_upon? == true && @empty == false && @ship.health == 0
      return "X"
    elsif self.fired_upon? == true && @empty == false
      return "H"
    elsif self.fired_upon? == true && @empty == true
      return "M"
    elsif show_ship && @ship
      return "S"
    else 
      return "."
    end
  end




end