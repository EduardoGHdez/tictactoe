class Player
    attr_accessor :name
    def initialize (type: nil, player_number: nil)
        puts "Player #{player_number} name? "
        @name = gets.chomp
        @score = 0
        @type = type
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
