require_relative 'robot_command'

class Application
  def parse_command(command)
    RobotCommand.new
  end
end
