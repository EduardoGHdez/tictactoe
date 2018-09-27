require 'rspec'
require_relative '../lib/player.rb'

RSpec.describe Player do
    describe '#wins' do
        it 'returns the updated player score, adding one point' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            expect(player.wins).to eq 1
            expect(player.wins).to eq 2
        end
    end
    describe '#score' do
        it 'returns the actual score' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            expect(player.score).to eq 0
            player.wins
            expect(player.score).to eq 1
        end 
    end
    describe 'type' do
        it 'returns the player type (X or O)' do
            player = Player.new(type: "X", player_number: 1, name: "Eduardo")
            expect(player.type).to eq "X"
        end
    end                
end
