require_relative 'spec_helper'
require 'robot'

RSpec.describe 'Robot' do
  let(:robot) { Robot.new(table) }
  let(:table) { double('Table') }
  let(:valid_position) { true }

  describe '#place' do
    let(:point) { double('Point', x: 0, y: 0, is_on?: valid_position) }
    let(:facing) { double('Direction', facing: :north) }

    it 'allows valid input' do
      expect(robot.place(point, facing)).to be_truthy
    end

    it 'sets the position and facing of the robot' do
      robot.place(point, facing)

      expect(robot.position).to eq point
      expect(robot.direction).to eq facing
    end

    context 'when placing off the table' do
      let(:valid_position) { false }

      it 'does not place the robot' do
        robot.place(point, facing)
        expect(robot.position).to be_a NullPoint
      end
    end
  end

  describe '#move' do
    context 'when not placed' do
      subject { robot.move }

      it { is_expected.to be_a NullPoint }
    end

    context 'when placed' do
      let(:point) { double('Point', x: 0, y: 0, north: new_point, is_on?: valid_position) }
      let(:facing) { double('Direction', facing: :north) }
      let(:new_point) { double('Point', x: 0, y: 1, is_on?: valid_position) }

      before do
        robot.position = point
        robot.direction = facing
      end

      it 'should move the robot' do
        robot.move
        expect(point).to have_received(:north)
        expect(robot.position).to eq new_point
      end

      context 'when the point is off the board' do
        let(:valid_position) { false }

        it 'should not move the robot' do
          robot.move
          expect(point).to have_received(:north)
          expect(robot.position).to eq point
        end
      end
    end
  end
end
