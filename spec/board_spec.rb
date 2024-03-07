require 'spec_helper'

RSpec.describe Board do
 describe '#valid_coordinate' do
  it 'checks if a coordinate is valid' do
    board = Board.new
    expect(board.valid_coordinate?("A9")).to eq(false)
    expect(board.valid_coordinate?("A3")).to eq(true)
  end
 end

 
end