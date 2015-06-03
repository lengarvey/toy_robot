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

  describe '#north' do
    subject { Point.new(0, 0).north.y }

    it { is_expected.to eq 1 }
  end

  describe '#south' do
    subject { Point.new(0, 2).south.y }

    it { is_expected.to eq 1 }

    it 'refuses to move south too many times' do
      expect(Point.new(0, 0).south.y).to eq 0
    end
  end

  describe '#east' do
    subject { Point.new(0, 2).east.x }

    it { is_expected.to eq 1 }
  end

  describe '#west' do
    subject { Point.new(3, 2).west.x }

    it { is_expected.to eq 2 }

    it 'refuses to move west too many times' do
      expect(Point.new(0, 0).west.x).to eq 0
    end
  end
end
