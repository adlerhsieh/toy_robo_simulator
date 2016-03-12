require 'colorize'

TIP = "#{'WARNING'.colorize(:red)}
- PLACE should take 3 arguments: x, y, and orientation. e.g. PLACE 1 2 NORTH
- Other commands take no argument.".freeze

HELP = "Available Commands:
- PLACE:  Place a robo. Requires x, y, and orientation arguments.
          e.g. PLACE 2 5 NORTH
- MOVE:   Move forward
- LEFT:   Turn left
- RIGHT:  Turn right
- REPORT: Report current position and orientation
- HELP:   Display all available commands".freeze

MESSAGE = "\n#{'Welcome to Toy Robo Simulator!'.colorize(:green)}
\n#{HELP}\nUse PLACE first to start the simulation :)\n\n".freeze

WARNING = "Command Not Found. See 'HELP'.".freeze
