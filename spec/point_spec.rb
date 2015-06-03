require_relative 'spec_helper'
require 'point'

RSpec.describe 'Point' do
  it 'accepts valid input' do
    expect(Point.new(0, 0)).to be_a Point
  end

  it 'rejects negative and non-integer values' do
    expect{ Point.new(-1, 0) }.to raise_error Point::InvalidArgumentError
    expect{ Point.new(0, -2) }.to raise_error Point::InvalidArgumentError
    expect{ Point.new("blue", -2) }.to raise_error Point::InvalidArgumentError
  end

  it 'stores the x and y values' do
    expect(Point.new(1, 0).x).to eq 1
    expect(Point.new(0, 2).y).to eq 2
  end
end
