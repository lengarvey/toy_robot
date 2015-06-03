require_relative 'spec_helper'
require 'robot'

RSpec.describe 'Robot' do
  let(:robot) { Robot.new(table) }
  let(:table) { double('Table', include?: valid_position) }
  let(:valid_position) { true }

  describe '#place' do
    let(:point) { double('Point', x: 0, y: 0) }
    let(:facing) { double('Direction', facing: :north) }

    it 'allows valid input' do
      expect(robot.place(point, facing)).to be_truthy
    end

    it 'sets the position and facing of the robot' do
      robot.place(point, facing)

      expect(robot.position).to eq point
      expect(robot.direction).to eq facing
    end
  end

  describe '#move' do
    context 'when not placed' do
      subject { robot.move }

      it { is_expected.to be_a NullPoint }
    end

    context 'when placed' do
      let(:point) { double('Point', x: 0, y: 0) }
      let(:facing) { double('Direction', facing: :north) }

      before do
        robot.place(point, facing)
      end

      it 'should move the robot' do
        expect(point).to receive(:north)
        robot.move
      end
    end
  end
end
