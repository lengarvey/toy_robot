require_relative 'spec_helper'
require 'application'

RSpec.describe 'Application' do
  let(:app) { Application.new }

  describe '#execute' do
    context 'for an unplaced robot' do
      it 'should ignore a move command' do
        expect {
          app.execute('MOVE')
        }.to_not change{ app.robot.position }
      end

      it 'should ignore a left command' do
        expect {
          app.execute('LEFT')
        }.to_not change{ app.robot.direction }
      end

      it 'should ignore a right command' do
        expect {
          app.execute('right')
        }.to_not change{ app.robot.direction }
      end
    end

    describe 'placing a robot' do
      it 'should place the robot' do
        app.execute('PLACE 0,0,NORTH')

        expect(app.robot.position.x).to eq 0
        expect(app.robot.position.x).to eq 0
        expect(app.robot.direction.facing).to eq :north
      end
    end

    context 'after placing the robot' do
      before do
        app.execute('PLACE 0,0,NORTH')
      end

      it 'can be moved, but not off the edge' do
        4.times do
          expect {
            app.execute('MOVE')
          }.to change{ app.robot.position }
        end

        expect {
          app.execute('MOVE')
        }.to_not change{ app.robot.position }
      end

      it 'can be turned' do
        expect {
          app.execute('LEFT')
        }.to change{ app.robot.direction }

        expect {
          app.execute('right')
        }.to change{ app.robot.direction }
      end
    end

    describe 'the robot given a script of commands' do
      let(:script) do
        [
          'PLACE 1,2,EAST',
          'MOVE',
          'MOVE',
          'LEFT',
          'MOVE',
        ]
      end

      it 'should report the correct position and facing' do
        script.each {|s| app.execute(s) }

        expect(app.robot.to_s).to eq "Robot is: 3,3 Facing: NORTH"
      end
    end
  end
end
