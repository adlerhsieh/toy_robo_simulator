require_relative 'toy_robo_simulator/version'
require_relative 'toy_robo_simulator/message'
require_relative 'toy_robo_simulator/table'
require_relative 'toy_robo_simulator/validator'
require_relative 'toy_robo_simulator/robo'
require_relative 'toy_robo_simulator/console'

# This module includes all other modules and classes in this program.
# Basically it can be divided into:
#
# - Console: Offering a command line interface for input & output.
# - Robo: A robot simulating the movement on a table.
# - Validator: Validating the robo's actions and their prerequisities.
# - Others
#
module ToyRoboSimulator
  ORIENTATIONS = %i(north west south east).freeze
end
