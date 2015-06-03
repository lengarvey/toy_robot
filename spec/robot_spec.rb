require_relative 'spec_helper'
require 'robot'

RSpec.describe 'Robot' do
  let(:robot) { Robot.new() }
  let(:table) { double('Table') }

  describe '#place' do
    let(:point) { double('Point', x: 0, y: 0) }
    let(:facing) { double('Direction', facing: :north) }

    it 'allows valid input' do
      expect(robot.place(point, facing)).to be_truthy
    end

    it 'sets the position and facing of the robot' do
      robot.place(point, facing)

      expect(robot.position).to eq point
      expect(robot.facing).to eq facing
    end
  end
end
