require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
     
      @cups[idx]= [:stone] * 4
    end
  end

  def valid_move?(start_pos)
   raise "Invalid starting cup" if !start_pos.between?(0,12)
   raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    idx=start_pos
    
    until @cups[start_pos].empty?
      idx+=1
      idx=0 if idx>13
      if idx == 6
        @cups[6] << @cups[start_pos].pop if current_player_name == @name1
      elsif idx == 13
        @cups[13] << @cups[start_pos].pop if current_player_name == @name2
      else
        @cups[idx] << @cups[start_pos].pop 
      end
    end
    render
    next_turn(idx)
  end
 

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
   (0..5).all?{|index| @cups[index].empty?}||(7..12).all?{|index| @cups[index].empty?}
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end
