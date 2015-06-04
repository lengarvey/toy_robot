require_relative 'spec_helper'
require 'robot_command'

RSpec.describe 'RobotCommand' do
  let(:point) { double('Point') }
  let(:direction) { double('Direction') }

  it 'creates a command object storing the action' do
    expect(RobotCommand.new(:move).action).to eq :move
  end

  it 'creates a command object storing the arguments' do
    expect(RobotCommand.new(:place, point, direction).arguments).to eq [point, direction]
  end

  describe 'providing the wrong arguments for an action' do
    describe 'place' do
      it 'errors unless exactly 2 arguments are provided' do
        expect { RobotCommand.new(:place) }.to raise_error RobotCommand::InvalidArgumentError
        expect { RobotCommand.new(:place, point) }.to raise_error RobotCommand::InvalidArgumentError
        expect { RobotCommand.new(:place, point, point, direction) }.to raise_error RobotCommand::InvalidArgumentError
      end
    end

    describe 'move' do
      it 'errors unless exactly 0 arguments are provided' do
        expect { RobotCommand.new(:place, point) }.to raise_error RobotCommand::InvalidArgumentError
      end
    end

    describe 'foo' do
      it 'errors' do
        expect { RobotCommand.new(:foo) }.to raise_error RobotCommand::InvalidArgumentError
        expect { RobotCommand.new(:foo, point) }.to raise_error RobotCommand::InvalidArgumentError
      end
    end
  end
end
