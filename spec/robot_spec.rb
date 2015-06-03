require_relative 'spec_helper'
require 'robot'

RSpec.describe 'Robot' do
  subject(:robot) { Robot.new }

  describe '#place' do
    let(:point) { double('Point', x: 0, y: 0) }

    it 'allows valid input' do
      expect(robot.place(point, :north)).to eq true
    end
  end
end
