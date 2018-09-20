class Player
    attr_accessor :name

    def initialize (type: nil, player_number: nil, name: nil)        
        if name == nil 
            puts "Player #{player_number} name? "
            name = $stdin.gets.chomp                    
        end 
        if type == nil
            puts "X or O?"
            @type = gets.chomp            
        end
        @name = name ? name : "player_#{player_number}"
        @type = type
        @score = 0
    end

    def wins
        @score += 1
    end

    def score
        @score
    end

    def type
        @type
    end
end
