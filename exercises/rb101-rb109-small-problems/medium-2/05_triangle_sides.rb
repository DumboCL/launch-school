def is_triangle?(num1, num2, num3)
  arr = [num1, num2, num3]
  return false if arr.any? { |num| num <= 0 }
  arr.sort!
  arr[0] + arr[1] > arr[2]
end

def triangle(side1, side2, side3)
  return :invalid unless is_triangle?(side1, side2, side3)
  if side1 == side2 && side2 == side3
    :equilateral
  elsif side1 != side2 && side2 != side3 
    :scalene
  else
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid