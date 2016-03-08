AvailableCommands = %w(help place move left right report)

Help = "Available Commands:
- HELP:   Display all available commands
- PLACE:  Place the robo at a position
- MOVE:   Move forward
- LEFT:   Turn left
- RIGHT:  Turn right
- REPORT: Report current position and orientation
"

Message = "\nWelcome to Toy Robo Simulator!
#{Help}
Use PLACE first to start the simulation :)\n 
" 

Warning = "
Unknown command.
\n#{Help}\n"

Orientations = %i(north west south east)
