require_relative 'player'
require_relative 'board'


class TicTacToe

    def initialize
        @players = [Player.new(type:"X", player_number:1), Player.new(type:"O", player_number:2)]
        @board = Board.new
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
end

game = TicTacToe.new
game.play
