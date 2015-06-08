require_relative 'spec_helper'
require 'application'

RSpec.describe 'Application' do
  describe '#parse_command' do
    let(:app) { Application.new }

    describe 'commands' do
      let(:robot_command) { app.parse_command(command) }

      describe 'invalid command' do
        let(:command) { 'FOO 0,0,EAST' }

        it 'creates a null command' do
          expect(robot_command).to be_a_kind_of NullRobotCommand
        end
      end

      describe 'PLACE' do
        let(:command) { 'PLACE 0,0,EAST' }

        it 'creates a valid command' do
          expect(robot_command).to be_a_kind_of RobotCommand
          expect(robot_command.action).to eq :place
          expect(robot_command.arguments[0]).to be_a Point
        end
      end

      describe 'MOVE' do
        let(:command) { 'MOVE' }

        it 'creates a valid command' do
          expect(robot_command).to be_a_kind_of RobotCommand
          expect(robot_command.action).to eq :move
          expect(robot_command.arguments.length).to eq 0
        end
      end

      describe 'LEFT' do
        let(:command) { 'LEFT' }

        it 'creates a valid command' do
          expect(robot_command).to be_a_kind_of RobotCommand
          expect(robot_command.action).to eq :left
        end
      end

      describe 'RIGHT' do
        let(:command) { 'RIGHT' }

        it 'creates a valid command' do
          expect(robot_command).to be_a_kind_of RobotCommand
          expect(robot_command.action).to eq :right
        end
      end

      describe 'REPORT' do
        let(:command) { 'REPORT' }

        it 'creates a valid command' do
          expect(robot_command).to be_a_kind_of RobotCommand
          expect(robot_command.action).to eq :report
        end
      end
    end
  end
end
