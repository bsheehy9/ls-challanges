class Triangle
  attr_reader :sides

  def initialize(side_one, side_two, side_three)
    @sides = [side_one, side_two, side_three]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.count(sides[0]) == 3
      'equilateral'
    elsif sides.any? { |side| sides.count(side) == 2}
      'isosceles'
    elsif sides.all? { |side| sides.count(side) == 1 }
      'scalene'
    end
  end

  private

  def valid?
    largest_side = sides.max
    sides.min > 0 &&
      (sides.sum - largest_side) > largest_side
  end
end

triangle = Triangle.new(1, 1, 1)
puts triangle.kind
