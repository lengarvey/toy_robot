# Toy Robot

An example implementation of the common toy robot problem.

## Installing and running:

1. `git clone` the repo
2. `bundle` to install `rspec`
3. `rspec` to run the specs
4. `bin/toy_robot` to run the robot. You'll be presented with a prompt when you need to enter a command.

## Example run:

```
ᐅ bin/toy_robot
Started toy robot.
Commands:
PLACE X,Y,DIRECTION
MOVE
LEFT
RIGHT
REPORT
> PLACE 1,1,EAST
> REPORT
Robot is: 1,1 Facing: EAST
> MOVE
> REPORT
Robot is: 2,1 Facing: EAST
> LEFT
> MOVE
> MOVE
> REPORT
Robot is: 2,3 Facing: NORTH
> LEFT
> MOVE
> MOVE
> REPORT
Robot is: 0,3 Facing: WEST
> MOVE
> REPORT
Robot is: 0,3 Facing: WEST
```

## Things I like

* The heavy use of the [null object pattern](http://en.wikipedia.org/wiki/Null_Object_pattern). This dramatically cleans up the number of conditionals in the app when dealing with the robot being placed or unplaced. It also handles: invalid commands, invalid points, and invalid directions.
* The "immutability" of the robot's position. Instead of mutating the robots position I ask the current position for a new position based on the current facing of the robot. Likewise instead of mutating the current facing of the robot I use a factory method on the direction to simply create a new direction for the robot to face. This works quite well with the use of the null object pattern.
* Lots of tests. Tests are good, especially when they run quickly
* No external dependencies. It would be easy to add in a command line gem like thor. Often I'd choose to do this but found some enjoyment in the act of doing the simplest thing that could work.
