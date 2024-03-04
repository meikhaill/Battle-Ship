class Board 
  attr_accessor :cells
  def initialize
    @cells = {}
    ('A'..'D').each do |row|
      (1..4).each do |col|
        coordinate = "#{row}#{col}"
        @cells[coordinate] = Cell.new(coordinate)
      end
    end
  end

  def valid_coordinate?(coordinate)
    if @cells.include?(coordinate)
      return true
    else
      return false
    end
  end

  def valid_placement?(ship, coords)
    
    if ship.length == coords.size
      @cells.keys.each_cons(2).all? do |a, b| 
        if b == a + 1
          return true
        end
      end
    end
  end
end