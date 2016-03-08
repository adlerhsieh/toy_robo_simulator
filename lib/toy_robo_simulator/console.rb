module ToyRoboSimulator
  class Console
    def self.init
      n = 0
      puts ::Message
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
      action = args[0].gsub("\n","").downcase
      case
      when action == 'exit'
        exit_program
      when action == 'help'
        help
      when ::AvailableCommands.include?(action)
        begin
          @robo.send(action.to_sym, *args[1..-1])
        rescue ArgumentError => e
          puts "PLACE should come with x, y, and orientation.\ne.g. PLACE 1 2 NORTH"
        end
      else
        puts ::Warning
      end
    end

    private

    def self.exit_program
     puts "\nThank You!\n\n"
     exit 
    end

    def self.help
      puts Help
    end
  end
end

