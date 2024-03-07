class Board 
  attr_accessor :cells
  def initialize
    @horizontal = false
    @vertical = false
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
    #gpt response
    return false if coords.size != ship.length

    numeric_coords = coords.map { |coord| [coord[0].ord - 'A'.ord + 1, coord[1].to_i] }
    horizontal = numeric_coords.map(&:last).uniq.size == 1
    vertical = numeric_coords.map(&:first).uniq.size == 1

    return false unless horizontal || vertical

    sorted_coords = horizontal ? numeric_coords.sort_by { |coord| coord[1] } : numeric_coords.sort_by { |coord| coord[0] }

    continuity_check = sorted_coords.each_cons(2).all? do |a, b|
      horizontal ? (b[1] - a[1] == 1) : (b[0] - a[0] == 1)
    end

    return false unless continuity_check

    return false if numeric_coords.any? { |x, y| x < 1 || x > 4 || y < 1 || y > 4 }

    coords.each do |coordinate|
      return false if @cells[coordinate] && @cells[coordinate].ship
    end


    true
  end

end