class RobotCommand
  class InvalidArgumentError < StandardError;end

  attr_reader :action, :arguments

  def initialize(action, *arguments)
    @action = action
    @arguments = arguments

    validate_action
    validate_arguments
  end

  ACTION_ARGUMENTS = {
    place: 2,
    move: 0,
    left: 0,
    right: 0,
    report: 0
  }

  private

  def validate_action
    ACTION_ARGUMENTS.keys.include? @action
  end

  def validate_arguments
    raise InvalidArgumentError, 'incorrect number of arguments' unless
      ACTION_ARGUMENTS[@action] == @arguments.length
  end
end

class NullRobotCommand
  def action
  end
end
