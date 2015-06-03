require_relative 'spec_helper'
require 'direction'

RSpec.describe 'Direction' do
  it 'accepts valid input' do
    expect(Direction.new(:north)).to be_a Direction
  end

  it 'rejects invalid directions' do
    expect{ Direction.new(:foo) }.to raise_error Direction::InvalidArgumentError
    expect{ Direction.new(nil) }.to raise_error Direction::InvalidArgumentError
  end

  describe '#left' do
    subject { Direction.new(facing).left.facing }

    context 'when facing north' do
      let(:facing) { :north }

      it { is_expected.to eq :west }
    end

    context 'when facing east' do
      let(:facing) { :east }

      it { is_expected.to eq :north }
    end

    context 'when facing south' do
      let(:facing) { :south }

      it { is_expected.to eq :east }
    end

    context 'when facing west' do
      let(:facing) { :west }

      it { is_expected.to eq :south }
    end
  end

  describe '#right' do
    subject { Direction.new(facing).right.facing }

    context 'when facing north' do
      let(:facing) { :north }

      it { is_expected.to eq :east }
    end

    context 'when facing east' do
      let(:facing) { :east }

      it { is_expected.to eq :south }
    end

    context 'when facing south' do
      let(:facing) { :south }

      it { is_expected.to eq :west }
    end

    context 'when facing west' do
      let(:facing) { :west }

      it { is_expected.to eq :north }
    end
  end
end
