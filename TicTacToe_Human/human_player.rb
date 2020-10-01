class HumanPlayer

    attr_accessor :mark_value

    def initialize(mark_value)
        @mark_value=mark_value
    end

    def get_position(legal_positions)
        puts "Insert Poition (eg..2,0)"
        pos=gets.chomp.split(",").map(&:to_i)

        raise "Error in Position" if pos.length!=2
        pos
    end
end