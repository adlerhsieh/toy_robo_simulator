AVAILABLE_COMMANDS = %w(help place move left right report)

HELP = "Available Commands:
- PLACE:  Place the robo at a position. Requires x, y, and orientation arguments.
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

WARNING = "
Unknown command. Type HELP if you need it.\n
"

TIP = "\nWrong Format:
1. PLACE should take 3 arguments: x, y, and orientation. e.g. PLACE 1 2 NORTH
2. Other commands take no argument.\n\n"

ORIENTATIONS = %i(north west south east)
