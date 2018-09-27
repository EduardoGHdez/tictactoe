require 'rspec'
require_relative '../lib/tictactoe.rb'


RSpec.describe TicTacToe do
    describe '#play' do               
        context 'It is a simple game sequence, where player one or player two can win or tie' do
            it 'should return a message that says Player one won' do                                
                $stdin = StringIO.new("Pancho\nJuan\n1\n2\n3\n4\n5\n6\n7")
                game = TicTacToe.new  
                expect(game.play).to eq "\n\nPancho wins!!\n\n"                                                               
                $stdin = STDIN
            end
            it 'should return a message that says Player two won' do                                
                $stdin = StringIO.new("Pancho\nJuan\n1\n4\n9\n5\n3\n6\n")
                game = TicTacToe.new  
                expect(game.play).to eq "\n\nJuan wins!!\n\n"                                                               
                $stdin = STDIN
            end
            it 'should return a message that says there is tie' do                                
                $stdin = StringIO.new("Pancho\nJuan\n1\n2\n3\n4\n5\n6\n8\n7\n9")
                game = TicTacToe.new  
                expect(game.play).to eq "\n\nPancho wins!!\n\n"                                                               
                $stdin = STDIN
            end
        end
    end
end