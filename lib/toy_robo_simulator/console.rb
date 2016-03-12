module ToyRoboSimulator
  # The console is responsible for initaing a command line interface for
  # users to access the program.
  class Console
    attr_accessor :robo
    AVAILABLE_COMMANDS = %w(place move left right report help exit).freeze

    def initialize
      puts MESSAGE
      @n = 0
      @robo = Robo.new
      print "#{format('%02d', @n)} > "
    end

    def watch
      command = STDIN.gets.chomp
      while command
        run(command)
        print "#{format('%02d', @n += 1)} > "
        command = STDIN.gets.chomp
      end
    end

    def run(command)
      args = command.split(' ').map(&:chomp).map(&:downcase)
      if AVAILABLE_COMMANDS.include?(args[0])
        process(args[0], args[1..-1])
      else
        puts WARNING
      end
    end

    private

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
