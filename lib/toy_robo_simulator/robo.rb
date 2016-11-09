module ToyRoboSimulator
  # Robo is the character of this program. It serves to simulate the movement of a robot on a table.
  # The available actions are place, move, left, right, and report.
  # Each action is validated before execution
  # and will respond with the result.
  class Robo
    include Validator
    attr_accessor :x, :y, :orientation

    # Initializes a Robo instance with a table sizes 5x5.
    def initialize
      @table  = Table.new(5, 5)
      @errors = []
    end

    # Places the robo on the table. The x and y arguments indicates its position.
    # The positions shoule be within the range of the table.
    # The orientation is limited to either north, south, west, and east.
    # Any invalid argument will not set the Robo's attributes.
    #
    # ```
    # robo = ToyRoboSimulator::Robo.new
    # robo.place(1, 2, :north) # => 'It is placed.'
    # robo.x # => 1
    # robo.y # => 2
    # robo.orientation # => :north
    #
    # robo.place("foo", "bar", :south)
    # # => 'X must be a number'
    # # => 'Y must be a number'
    # robo.x # => nil
    # robo.y # => nil
    # ```
    def place(x, y, orientation)
      @x, @y = x, y
      @orientation = orientation.downcase.to_sym
      return unless valid_placement?
      puts 'It is placed.'
    end

    # Moves forward one space. This method is noly valid after the Robo is placed.
    # Facing north will move the Robo one unit toward north.
    # However, no further move is allowed if the Robo is at the edge of a table,
    # which means, for example, its x coordinate is equal to the max value of
    # a Table's width.
    #
    # ```
    # robo = ToyRoboSimulator::Robo.new
    # robo.move # => 'The Robo is not placed yet. Use PLACE command first.'
    #
    # robo.place(4, 2, :east) # => 'It is placed.'
    # robo.x # => 4
    # robo.move # => 'It moves forward.'
    # robo.x # => 5
    # robo.move # => 'The Robo is at edge. No further move is allowed.'
    # robo.x # => 5
    # ```
    def move
      return unless placed? && moveable?
      move_forward(1)
      puts 'It moves forward.'
    end

    # Turns left. It changes the Robo's current orientation.
    # This method is noly valid after the Robo is placed.
    #
    # ```
    # robo = ToyRoboSimulator::Robo.new
    # robo.left # => 'The Robo is not placed yet. Use PLACE command first.'
    #
    # robo.place(3, 3, :east) # => 'It is placed.'
    # robo.orientation # => :east
    # robo.left # => 'It turns left'
    # robo.orientation # => :north
    # ```
    def left
      return unless placed?
      turn(:left)
      puts 'It turns left.'
    end

    # Turns right. See `#left`.
    def right
      return unless placed?
      turn(:right)
      puts 'It turns right'
    end

    # Reports current postion and orientation.
    # This method is noly valid after the Robo is placed.
    #
    # ```
    # robo = ToyRoboSimulator::Robo.new
    # robo.report # => 'The Robo is not placed yet. Use PLACE command first.'
    #
    # robo.place(3, 3, :east) # => 'It is placed.'
    # robo.report # => 'Robo is now at (3,3) facing EAST'
    # ```
    def report
      return unless placed?
      puts "Robo is now at (#{@x},#{@y}) facing #{@orientation.to_s.upcase}"
    end

    private

    def warning
      @errors.each { |message| puts message }
      @errors = []
    end

    def turn(direction)
      i            = direction == :left ? 1 : -1
      index        = ORIENTATIONS.index(@orientation) + i
      @orientation = ORIENTATIONS[index] || :north
    end

    def move_forward(unit)
      case @orientation
      when :north then @y += unit
      when :east  then @x += unit
      when :south then @y -= unit
      when :west  then @x -= unit
      end
    end
  end
end
