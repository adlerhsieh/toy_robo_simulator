module ToyRoboSimulator
  # The console is responsible for initaing a command line interface for 
  # users to access the program.
  class Console
    attr_accessor :robo
    def initialize
      puts ::MESSAGE
      @n = 0
      @robo = Robo.new
      print "#{format('%02d', @n)} > "
    end

    def watch(stdin=$stdin)
      command = $stdin.gets.chomp
      while command
        run(command)
        print "#{format('%02d', @n += 1)} > "
        command = $stdin.gets.chomp
      end
    end

    def run(command)
      args   = command.split(' ')
      action = args[0].chomp.downcase
      case
      when ::AVAILABLE_COMMANDS.include?(action)
        process(action, args)
      when action == 'exit'
        exit_program
      when action == 'help'
        help
      else
        puts ::WARNING
      end
    end

    private

    def process(action, args)
      begin
        @robo.send(action.to_sym, *args[1..-1])
      rescue ArgumentError => e
        tip if e.message.include? 'wrong number of arguments'
      end
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
