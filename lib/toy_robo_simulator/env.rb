AVAILABLE_COMMANDS = %w(help place move left right report)

HELP = "Available Commands:
- PLACE:  Place a robo. Requires x, y, and orientation arguments.
          e.g. PLACE 2 5 NORTH
- MOVE:   Move forward
- LEFT:   Turn left
- RIGHT:  Turn right
- REPORT: Report current position and orientation
- HELP:   Display all available commands
"

MESSAGE = "\nWelcome to Toy Robo Simulator!
#{HELP}
Use PLACE first to start the simulation :)\n
"

WARNING = 'Unknown command. Type HELP if you need it.'

TIP = "Wrong Format:
- PLACE should take 3 arguments: x, y, and orientation. e.g. PLACE 1 2 NORTH
- Other commands take no argument."

ORIENTATIONS = %i(north west south east)
