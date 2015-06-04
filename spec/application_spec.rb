require_relative 'spec_helper'
require 'application'

RSpec.describe 'Application' do
  describe '#parse_command' do
    let(:app) { Application.new }

    describe 'PLACE' do
      context 'with a valid command' do
        let(:command) { 'PLACE 0,0,EAST' }
        let(:robot_command) { app.parse_command(command) }

        it 'creates a valid command' do
          expect(robot_command).to be_a_kind_of RobotCommand
          expect(robot_command.action).to eq :place
          expect(robot_command.arguments[0]).to be_a Point
        end
      end
    end

    describe 'MOVE' do

    end

    describe 'LEFT' do

    end

    describe 'RIGHT' do

    end

    describe 'REPORT' do

    end
  end
end
