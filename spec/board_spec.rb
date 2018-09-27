require 'rspec'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

RSpec.describe Board do

    describe '#is_full?' do 
        context 'when the board have empty (nil) spaces' do
            it 'return false, because it have nil spaces' do
                board = Board.new
                expect(board.is_full?).to eq false
            end
        end

        context 'when the board is full' do
            it 'returns true, because board is full' do
                board = Board.new        
                board.grid = board.grid.each.map{|x| "X"}                
                expect(board.is_full?).to eq true
            end
        end
    end

    describe '#mark_square' do
        context 'when square is available' do
            #
            it 'should return true' do                
                player = Player.new(type: "X", player_number: 1, name: "Eduardo")
                board = Board.new  
                #allow($board).to receive(:gets).and_return("1\n2\n")              
                $stdin = StringIO.new("1\n2\n")
                expect(board.mark_square(player: player)).to eq true                
                expect(board.mark_square(player: player)).to eq true
                $stdin = STDIN                
            end
        end
        context 'when square is not available or fill' do            
            it 'should return true' do                
                player = Player.new(type: "X", player_number: 1, name: "Eduardo")
                board = Board.new
                #allow($stdin).to receive(:gets).and_return("1\n1\n")
                $stdin = StringIO.new("1\n1\n")
                board.mark_square(player: player)                
                expect(board.mark_square(player: player)).to eq false                               
                $stdin = STDIN
            end
        end
    end

    describe '#three_in_line?' do        
        it 'should return true if there are three same symbols horizontal aligned' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            board = Board.new
            #allow($stdin).to receive(:gets).and_return("1\n2\n3\n")
            $stdin = StringIO.new("1\n2\n3\n")
            (1..3).step(1){ board.mark_square(player:player)}
            expect(board.three_in_line?(current_player: player)).to eq true
            $stdin = STDIN
        end
        it 'should return true if there are three same symbols vertical aligned' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            board = Board.new
            #allow($stdin).to receive(:gets).and_return("1\n4\n7\n")
            $stdin = StringIO.new("1\n4\n7\n")
            (1..3).step(1){ board.mark_square(player:player)}
            expect(board.three_in_line?(current_player: player)).to eq true
            $stdin = STDIN
        end
        it 'should return true if there are three same symbols diagonal aligned' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            board = Board.new
            #allow($stdin).to receive(:gets).and_return("1\n5\n9\n")
            $stdin = StringIO.new("1\n5\n9\N")
            (1..3).step(1){ board.mark_square(player:player)}
            expect(board.three_in_line?(current_player: player)).to eq true
            $stdin = STDIN
        end
        it 'should return true if there are three same symbols diagonal inverted aligned' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            board = Board.new
            #allow($stdin).to receive(:gets).and_return("3\n5\n7\n")
            $stdin = StringIO.new("3\n5\n7\n")
            (1..3).step(1){ board.mark_square(player:player)}
            expect(board.three_in_line?(current_player: player)).to eq true
            $stdin = STDIN            
        end
        it 'should return false if there are not three same symbols  aligned' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            board = Board.new        
            expect(board.three_in_line?(current_player: player)).to eq false
        end
    end    
end