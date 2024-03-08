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

  def place(coords)
    
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
      # Handle the case where the coordinate is not valid
      # For example, you could raise an error or return a specific value
      raise "Invalid coordinate: #{coordinate}"
    end
 end

  def render_check
    stat = cell.render
  "  1 2 3 4 \n" +
  "A . . . . \n" +
  "B . . . . \n" +
  "C . . . . \n" +
  "D . . . . \n"
  end

  def valid_coordinate?(coordinate)
    if @cells.include?(coordinate)
      return true
    else
      return false
    end
  end

  def render_all
    @cells.each do |cell|

      status = i.render
      print status
    end
  end
#everything above this is all fine and dandy, same with the other classes
 
  def valid_placement?(ship, coords)
    #from here down is gpt response based off of me pasting my code, repasting gpts new code and editing it
    
    return false if coords.size != ship.length
    #checking to make sure the amount of coords = length of the ship
    
    numeric_coords = coords.map { |coord| [coord[0].ord - 'A'.ord + 1, coord[1].to_i] }
    #coord[0].ord - 'A'.ord is just a creative way of turning it into a value 0-3
    #if the ord of index 1 is B then thats something like 98-97 which equates to 1 same as the index
    
    horizontal = numeric_coords.map(&:last).uniq.size == 1
    vertical = numeric_coords.map(&:first).uniq.size == 1
    #this just checks for duplicates split up by the array being first subarray being last
    
    return false unless horizontal == true && vertical == true
    
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