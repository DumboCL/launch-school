def xor?(boolean_1, boolean_2)
  (boolean_1 or boolean_2) && !(boolean_1 && boolean_2)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false