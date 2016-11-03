require 'readline'

module ToyRoboSimulator
  # The console is responsible for initaing an interactive command line interface for
  # users to access the program.
  class Console
    attr_accessor :robo
    # Available user-input commands
    AVAILABLE_COMMANDS = %w(place move left right report help exit).freeze

    # Initializes a CLI that includes a Robo instance.
    def initialize
      puts MESSAGE
      @robo = Robo.new
      # print "#{format('%02d', @n)} > "
    end

    # Starts watching for user input.
    def watch
      n = 0
      while cmd = Readline.readline("#{format('%02d', n)}> ", true)
        run(cmd)
        n += 1
      end
    end

    # Analyzes if command is available, and process the command.
    # The command should be separated either by white spaces or commas.
    # However, only commands in AVAILABLE_COMMANDS are allowed.
    #
    # ```
    # console = ToyRoboSimulator::Console.new
    # console.run('hello world') # => 'unknown command.'
    # console.run('foo, bar') # => 'unknown command.'
    # console.run('exit') # => 'Thank You!'
    # ```
    def run(command)
      args = to_args(command)
      if AVAILABLE_COMMANDS.include?(args[0])
        process(args[0], args[1..-1])
      else
        puts WARNING
      end
    end

    private

    # Directly sends the command with arguments to the Robo instance.
    def process(action, args)
      case action
      when 'exit' then exit_program
      when 'help' then help
      else
        @robo.send(action.to_sym, *args)
      end
    rescue ArgumentError => e
      tip if e.message.include? 'wrong number of arguments'
    end

    def to_args(command)
      command.split(' ').map { |n| n.split(',') }.flatten.map(&:chomp).map(&:downcase)
    end

    def tip
      puts TIP
    end

    def exit_program
      puts "\nThank You!\n\n"
      exit
    end

    def help
      puts HELP
    end
  end
end
