def get_grade(score_1, score_2, score_3)
  average = (score_1 + score_2 + score_3).to_f / 3
  case average
  when (90..100)
    'A'
  when (80...90)
    'B'
  when (70...80)
    'C'
  when (60...70)
    'D'
  else
    'F'
  end
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"