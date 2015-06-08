require_relative 'robot_command'
require_relative 'point'
require_relative 'direction'

class Application
  def parse_command(command)
    command_matcher = COMMANDS.find do |c|
      c[:pattern].match(command)
    end

    send(command_matcher[:action], command, command_matcher[:pattern])
  end

  COMMANDS = [
    {
      pattern: /\APLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)\z/i,
      action: :place
    },
    {
      pattern: /\AMOVE\z/i,
      action: :move
    },
    {
      pattern: /\ALEFT\z/i,
      action: :left
    },
    {
      pattern: /\ARIGHT\z/i,
      action: :right
    },
    {
      pattern: /\AREPORT\z/i,
      action: :report
    },
    {
      pattern: /.*/,
      action: :null_command
    }
  ]

  private

  def place(command_string, pattern)
    match = pattern.match(command_string)
    point = Point.new(match[1].to_i, match[2].to_i)
    direction = Direction.new(match[3].downcase.to_sym)

    RobotCommand.new(:place, point, direction)
  end

  def move(command_string, pattern)
    RobotCommand.new(:move)
  end

  def left(command_string, pattern)
    RobotCommand.new(:left)
  end

  def right(command_string, pattern)
    RobotCommand.new(:right)
  end

  def report(command_string, pattern)
    RobotCommand.new(:report)
  end

  def null_command(command_string, pattern)
    NullRobotCommand.new
  end
end
