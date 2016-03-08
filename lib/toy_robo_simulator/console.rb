module ToyRoboSimulator
  class Console
    def self.init
      n = 0
      puts ::MESSAGE
      print "#{format('%02d', n)} > "
      @robo = Robo.new
      command = STDIN.gets
      while command
        run(command)
        print "#{format('%02d', n += 1)} > "
        command = STDIN.gets
      end
    end

    def self.run(command)
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

    private

    def self.exit_program
      puts "\nThank You!\n\n"
      exit
    end

    def self.help
      puts HELP
    end

    def self.tip
      puts TIP
    end
  end
end
