


class Board


       def initialize(size)
        @shown_board=Array.new(size){["_"]* size}
        @played_positions=[]
       end


       def valid(position)
        position.all? {|pos| pos.between?(0,@shown_board.length-1)} 
       end

       def empty?(position)
        !@played_positions.include?(position)
       end


       def print
        @shown_board.each {|row| puts row.join(" ")}

       end

       def []=(position,value)
         x,y=position
         @shown_board[x][y]=value
       end

       def [](pos)
        x,y=pos
        @shown_board[x][y]
       end

       def place_mark(position, mark)
        if empty?(position)&& valid(position)
            self[position]=mark
            @played_positions << position

        else
            p "Invalid Position..."
        end
       end

       def win_row?(mark)
        @shown_board.any? { |row|  row.all? {|e| e==mark}}
       end

       def win_col?(mark)
        @shown_board.transpose.any? {|col| col.all?(mark)}
       end

       def win_diagonal?(mark)
        left_start= (0...@shown_board.length).all? do |num|
                pos=[num, num]
                self[pos]==mark
        end

        right_start=(0...@shown_board.length).all? do |num|
            vert_pos=@shown_board.length - 1 -num
            pos=[num, vert_pos]
            self[pos]==mark
          end

          right_start || left_start
       end


       def win?(mark)
        win_col?(mark)|| win_diagonal?(mark)||win_row?(mark)
       end

       def empty_positions?
        @shown_board.any? {|ele| ele.any?("_")}
       end


       def legal_positions
        array_index = (0...@shown_board.length).to_a
        positions = array_index.product(array_index)
        positions.select { |pos| empty?(pos) }
       end

end


