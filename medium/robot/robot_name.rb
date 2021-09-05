=begin

=end

class Robot
  attr_accessor :name

  @@existing_robots = []

  def initialize
    @name = create_name
    @@existing_robots << name
  end

  def reset
    @@existing_robots.delete(name)
    self.name = create_name
    @@existing_robots << name
  end

  private

  def create_name
    loop do
      robot_name = ''
      2.times { robot_name << ('A'..'Z').to_a.sample }
      3.times { robot_name << rand(10).to_s }
      return robot_name unless @@existing_robots.include?(robot_name)
    end
  end
end

robot = Robot.new
puts robot.name
