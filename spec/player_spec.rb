require_relative '../lib/player'
require_relative '../lib/board'

describe Player do
  describe 'initialize' do
    it 'assigns the players with a name and shape' do
      player = Player.new('Jake', 'x')
      expect(player.name).to eq('Jake')
    end

    it 'assigns the players with a name and shape' do
      player = Player.new('Chad', 'o')
      expect(player.shape).to eq('o')
    end
  end
end
