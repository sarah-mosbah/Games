require_relative 'human_player.rb'
require_relative 'computer_player.rb'
require_relative 'board.rb'


class Game

  def initialize(board_size, hash)

    
    @board= Board.new(board_size)
    @players=hash.map do |mark, type|  
          type ? HumanPlayer.new(mark):  ComputerPlayer.new(mark) 
    end

    @current_player= @players[0]
    # @next_player= @player_2
  end


  def switch_turn
    index= @players.index(@current_player)
    next_player=index+1
    @current_player= @players[next_player % @players.length ]
  end


  def play

    while  @board.empty_positions?
        begin

            @board.print
        
            mark=@current_player.mark_value
            puts "Position For Player #{mark}"
            legal_moves=@board.legal_positions
            pos=@current_player.get_position(legal_moves)

            
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                @board.print
                puts "Victory!!!!"
                return
            end
            switch_turn
   
        rescue
            next
        end
    end

    puts "DRAW!!"

  end
end


g= Game.new(4,:X=>true,:O=>false)

 g.play