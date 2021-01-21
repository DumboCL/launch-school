class Triangle
  attr_reader :sides

  def initialize(*sides)
    raise ArgumentError, 'Invalid triangle lengths' unless valid?(sides)

    @sides = sides
  end

  def kind
    return 'equilateral' if equilateral?
    return 'isosceles' if isosceles?

    'scalene'
  end

  private

  def valid?(sides)
    return false unless side_all_positive?(sides)

    return true if sides[0] + sides[1] >= sides[2] &&
                   sides[1] + sides[2] >= sides[0] &&
                   sides[2] + sides[0] >= sides[1]

    false
  end

  def side_all_positive?(sides)
    sides.all?(&:positive?)
  end

  def equilateral?
    sides.count(sides[0]) == 3
  end

  def isosceles?
    sides.any? { |side| sides.count(side) >= 2 }
  end
end

# Triangle.new(3, -4, 0)
