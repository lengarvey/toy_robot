# Toy Robot

An example implementation of the common toy robot problem.

## Installing and running:

1. `git clone` the repo
2. `bundle` to install `rspec`
3. `rspec` to run the specs
4. `bin/toy_robot` to run the robot. You'll be presented with a prompt when you need to enter a command.

## Things I like

* The heavy use of the [null object pattern](http://en.wikipedia.org/wiki/Null_Object_pattern). This dramatically cleans up the number of conditionals in the app when dealing with the robot being placed or unplaced. It also handles: invalid commands, invalid points, and invalid directions.
* The "immutability" of the robot's position. Instead of mutating the robots position I ask the current position for a new position based on the current facing of the robot. Likewise instead of mutating the current facing of the robot I use a factory method on the direction to simply create a new direction for the robot to face. This works quite well with the use of the null object pattern.
* Lots of tests. Tests are good, especially when they run quickly
* No external dependencies. It would be easy to add in a command line gem like thor. Often I'd choose to do this but found some enjoyment in the act of doing the simplest thing that could work.

## Things I dislike

* The flat architecture of the app isn't ideal, but given the small size of the application it's fairly easy to understand. The more idiomatic app structure would be to create a `lib/toy_robot` structure and create a separate module.
* Lack of a namespace for the app. Not a big deal in itself given the size of the application, but could hamper re-usability.


