


class ComputerPlayer

    attr_accessor :mark_value

    def initialize(mark_value)
        @mark_value=mark_value
    end

    def get_position(legal_positions)
      play= legal_positions.sample
      puts "Computer Play #{play}"
      play
    end



end