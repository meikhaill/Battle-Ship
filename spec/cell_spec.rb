require 'spec_helper'

RSpec.describe Cell do
  describe '#initialize' do
  it 'initializes with a coordinate' do
    cell = Cell.new('B4')
    expect(cell.coordinate).to eq('B4')
  end
 end
end