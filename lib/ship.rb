class Ship
  attr_accessor :name, :health, :length
  def initialize(name, health)
    @name = name
    @health = health
    @length = health

  end
  

  def sunk?
    @health == 0 
  end

  def hit
    if @health > 0
      @health = @health - 1
    end
  end
      
end