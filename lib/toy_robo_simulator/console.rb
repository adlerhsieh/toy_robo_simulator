module ToyRoboSimulator
  class Console
    def initialize
      puts ::MESSAGE
      @n = 0
      @robo = Robo.new
      print "#{format('%02d', @n)} > "
    end

    def watch
      command = STDIN.gets
      while command
        run(command)
        print "#{format('%02d', @n += 1)} > "
        command = STDIN.gets
      end
    end

    def run(command)
      args   = command.split(' ')
      action = args[0].gsub("\n", '').downcase
      case
      when action == 'exit'
        exit_program
      when action == 'help'
        help
      when ::AVAILABLE_COMMANDS.include?(action)
        begin
          @robo.send(action.to_sym, *args[1..-1])
        rescue ArgumentError
          tip
        end
      else
        puts ::WARNING
      end
    end

    def exit_program
      puts "\nThank You!\n\n"
      exit
    end

    def help
      puts HELP
    end

    def tip
      puts TIP
    end
  end
end
