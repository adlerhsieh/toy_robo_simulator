module ToyRoboSimulator
  # Table is the environment in the program which decides
  # the length and width of the table. The table will be used to
  # validate the placement and movement of a Robo.
  #
  # The attributes x and y are the maximum values of length and width,
  # while 0 is the minimum value.
  class Table
    attr_reader :x, :y
    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end
