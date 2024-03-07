require 'spec_helper'

RSpec.describe Cell do
  describe '#initialize' do
    it 'initializes with a coordinate' do
      cell = Cell.new('B4')
      expect(cell.coordinate).to eq('B4')
    end
 end

  describe '#initialize' do
    it 'can initialize' do
      ship = Ship.new("cruiser", 3)
      cell = Cell.new("A4")
      expect(cell.coordinate).to eq("A4")
      expect(cell.empty?).to eq(true)
      expect(cell.fired).to eq(false)
    end
  end

      

  describe '#place_ship' do
    it 'returns the ship' do
      ship = Ship.new("cruiser", 3)
      cell = Cell.new("A4")
      cell.place_ship(ship)
      expect(cell.empty?).to eq(false)
    end
  end

  describe '#fired_upon?' do
    it 'checks if ship has been fired upon' do
      ship = Ship.new("cruiser", 3)
      cell = Cell.new("A4")
      cell.place_ship(ship)
      expect(cell.fired_upon?).to eq(false)
    end
  end

  describe '#render' do
    it 'checks if it renders state correctly' do
      ship = Ship.new("cruiser", 3)
      cell = Cell.new("A4")
      cell.place_ship(ship)
      cell.fire_upon
      # expect(cell.fired).to eq(true)
      expect(cell.render).to eq("H")
    end
  end
end