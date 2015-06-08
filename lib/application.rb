require_relative 'table'
require_relative 'robot'
require_relative 'command_parser'

class Application
  def initialize
    @table = Table.new
    @robot = Robot.new(@table)
    @parser = CommandParser.new
  end

  attr_reader :table, :robot, :parser

  def cli
    puts "Started toy robot.\n#{usage}"
    print "> "
    while command = gets.chomp do
      execute(command)
      print "> "
    end
  rescue Interrupt
    execute 'REPORT'
  end

  def execute(command)
    command = parser.parse_command(command)
    robot.send(command.action, *command.arguments)
  end

  def usage
    <<-USAGE
Commands:
PLACE X,Y,DIRECTION
MOVE
LEFT
RIGHT
REPORT
    USAGE
  end
end
