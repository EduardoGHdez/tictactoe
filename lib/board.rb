require 'matrix'

class Matrix 
    def []=(i, j, x)
      @rows[i][j] = x
    end
end

class Board 
    
    attr_accessor :grid
    #Create a nil 3*3 matrix
    def initialize    
        @grid = Matrix.build(3){nil}
    end
    # It could be false when any player wins or when the board is full
    def is_full?
        @grid.each.all?{|value| value.is_a? String}
    end
    #If the square is empty, it is filled, else not
    def mark_square (player: nil)                       
        puts "\nChoose one box, #{player.name}: "
        index = $stdin.gets.chomp.to_i    
        if @grid[(index-1)/3, (index-1)%3].is_a? String || index > 9 || index < 1
            puts "\nIneligible box!!\n"
            return false
        end
        @grid[(index-1)/3, (index-1)%3] = player.type                
        return true
    end

    def three_in_line? (current_player: nil)
        (0..2).each do |i|
            #Check rows and cols
            if  @grid.column(i).all?{ |value| value == current_player.type} || 
                @grid[i, 0..2].all?{ |value| value == current_player.type}  
                return true
            end            
        end
        #Check diagonals
        if @grid.each(:diagonal).all?{ |value| value == current_player.type } || 
           (@grid[2,0]== current_player.type && @grid[1,1]== current_player.type && @grid[0,2]== current_player.type)
            return true
        end
        return false
    end
    
    #It show the tic tac toe board
    def disp
        i = 0
        lines = 0
        @grid.each do |value|
            print " #{value} " 
            i += 1
            if(i == @grid.column_size && lines<2) 
                puts "\n"
                puts "---------"
                i=0
                lines += 1
            elsif i < 3  
                print "|"
            end            
        end            
        print "\n"
    end
end

