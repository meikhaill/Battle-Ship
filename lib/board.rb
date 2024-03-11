require_relative 'board.rb'
class Board 
  attr_accessor :cells
  def initialize
    @horizontal = false
    @vertical = false
    #no idea how i can test this
    @cells = {}
    ('A'..'D').each do |row|
      (1..4).each do |col|
        coordinate = "#{row}#{col}"
        @cells[coordinate] = Cell.new(coordinate)
      end
    end
  end

  def place(ship, coords)
    return false unless valid_placement?(ship, coords)
    
    coords.each do |coordinate|
      cell = @cells[coordinate]
      cell.place_ship(ship)
    end
    true
    
  end 

    def print_board
    puts "  1 2 3 4"
    ['A', 'B', 'C', 'D'].each do |row|
      print "#{row} "
      (1..4).each do |col|
        print "#{@cells["#{row}#{col}"].render} "
      end
      print "\n"
    end
  end

   def fire_upon(coordinate)
    if valid_coordinate?(coordinate)
      cell = @cells[coordinate]
      cell.fire_upon
    else
      raise "Invalid coordinate: #{coordinate}"
    end
 end

 
  # "  1 2 3 4 \n" +
  # "A . . . . \n" +
  # "B . . . . \n" +
  # "C . . . . \n" +
  # "D . . . . \n"
  

  def valid_coordinate?(coordinate)
    if @cells.include?(coordinate)
      return true
    else
      return false
    end
  end

   def render(show_ships = false)
       board_header = "  1 2 3 4 \n"
    board_rows = ['A', 'B', 'C', 'D'].map do |row|
      "#{row} " + (1..4).map { |col| @cells["#{row}#{col}"].render(show_ships) }.join(' ')
    end.join("\n")

    print board_header + board_rows + "\n"
  end
#everything above this is all fine and dandy, same with the other classes
 
  def valid_placement?(ship, coords)
    return false unless coords.size == ship.length
    rows = coords.map { |coord| coord[0].ord - 'A'.ord }
    cols = coords.map { |coord| coord[1..-1].to_i - 1 }
    
    linear_horizontal = rows.uniq.size == 1 && cols.each_cons(2).all? { |a, b| b == a + 1 }
    linear_vertical = cols.uniq.size == 1 && rows.each_cons(2).all? { |a, b| b == a + 1 }
    
    valid_placement = linear_horizontal || linear_vertical
    
    return false unless valid_placement
    true
  end

end