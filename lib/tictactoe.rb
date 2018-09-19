require_relative 'player'
require_relative 'board'

class TicTacToe

    def initialize
        @players = [Player.new(type:"X", player_number:1), Player.new(type:"O", player_number:2)]
        @board = Board.new
        ##Show how to play
        self.show_instructions
    end

    def play
        turn = 0
        while @board.continue? do            
            if @board.mark_square(player: @players[turn%2])                
                if @board.three_in_a_row?(player: @players[turn%2])
                    puts "#{@players[turn%2].name} wins"
                    @board.disp                          
                    break
                end
                @board.disp      
                turn += 1
            end                              
        end
    end
    
    def show_instructions
        i = 0
        lines = 0
        (1..9).each do |value|
            print " #{value} " 
            i += 1
            if(i == @board.grid.column_size && lines<2) 
                puts "\n"
                puts "-----------"
                i=0
                lines += 1
            elsif i < 3  
                print "|"
            end            
        end            
        print "\n"
    end    
end

