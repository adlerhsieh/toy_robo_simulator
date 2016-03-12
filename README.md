# Toy Robo Simulator

[![](https://travis-ci.org/adlerhsieh/toy_robo_simulator.svg)](https://travis-ci.org/adlerhsieh/toy_robo_simulator) [![Code Climate](https://codeclimate.com/github/adlerhsieh/toy_robo_simulator/badges/gpa.svg)](https://codeclimate.com/github/adlerhsieh/toy_robo_simulator) [![Test Coverage](https://codeclimate.com/github/adlerhsieh/toy_robo_simulator/badges/coverage.svg)](https://codeclimate.com/github/adlerhsieh/toy_robo_simulator/coverage)

Toy Robo Simulator is a command line application that simulates the movement of a toy robot, or robo, on a square table. Entering an interactive console, you have several commands to control the robo including `PLACE`, `MOVE`, `LEFT`, and `RIGHT`. It's like moving a character in a PRG game. Feel free to roam around. 

## Installation

```
gem install toy_robo_simulator
```

Since this is a standalone program, there is no need to install with a `Gemfile`.

## Initialize

```
robo
```

You should see a welcome message along with a command line prompt. Ready to move the robots!

## Available Commands

```ruby
PLACE
# Place a robo. Requires x, y, and orientation arguments. Arguments are separated by a white space.
# e.g. PLACE 2 5 NORTH

MOVE
# Move forward one space. e.g. Facing north will move the robo one unit toward north.

LEFT
# Turn left.

RIGHT
# Turn right.

REPORT
# Report current position and orientation.

HELP
# Display all available commands.
```

The commands are not case-sensitive. Either `PLACE`, `Place` or `place` will work. 

However, several rules to follow:

- A robo must be placed on the table before any other commands.
- The robo cannot be placed out of the table.
- The robo is not allowed to move out the the table.

## A Complete Example

```
Welcome to Toy Robo Simulator!

Available Commands:
- PLACE:  Place a robo. Requires x, y, and orientation arguments.
          e.g. PLACE 2 5 NORTH
- MOVE:   Move forward
- LEFT:   Turn left
- RIGHT:  Turn right
- REPORT: Report current position and orientation
- HELP:   Display all available commands
Use PLACE first to start the simulation :)

00 > PLACE 2 1 NORTH
It is placed.
01 > MOVE
It moves forward.
02 > LEFT
It turns left.
03 > REPORT
Robo is now at (2,2) facing WEST
04 > MOVE
It moves forward.
05 > RIGHT
It turns right
06 > MOVE
It moves forward.
07 > REPORT
Robo is now at (1,3) facing NORTH
08 > exit

Thank You!
```

## Development Documentation

Detailed documentations of every class, module, and method are on [RubyDoc](http://www.rubydoc.info/gems/toy_robo_simulator/1.0.0).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adlerhsieh/toy_robo_simulator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

