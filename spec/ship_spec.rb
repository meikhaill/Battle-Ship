require 'spec_helper'
# require_relative '../lib/ship'

RSpec.describe Ship do
 describe '#initialize' do
  it 'initializes with a name and health' do
    ship = Ship.new('Cruiser', 3)
    expect(ship.name).to eq('Cruiser')
    expect(ship.health).to eq(3)
  end
 end

 describe '#sunk?' do
    it 'asks if the ship has sunk and returns false' do
      ship = Ship.new("Cruiser", 3)
      expect(ship.sunk?).to eq(false)
    end

    it 'returns true when at 0' do
      ship = Ship.new("Cruiser", 0)
      expect(ship.sunk?).to eq(true)
    end
  end
end