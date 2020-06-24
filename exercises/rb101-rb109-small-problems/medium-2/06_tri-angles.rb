def is_trangle?(angs)
  return true if angs.sum.eql?(180) && !angs.any?(0)
  false
end

def triangle(ang1, ang2, ang3)
  angs = [ang1, ang2, ang3]
  return :invalid unless is_trangle?(angs)
  
  case 
  when angs.any?(90)
    :right
  when angs.all?(0...90)
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid