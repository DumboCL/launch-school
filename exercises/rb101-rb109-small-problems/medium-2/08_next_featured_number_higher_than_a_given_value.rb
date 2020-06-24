def is_uniq?(num)
  num.to_s.chars.all? { |n| num.to_s.chars.count(n) == 1 }
end

def featured(num)
  (num + 1..num * 2).each do |n|
    if n % 7 == 0 && n.odd?
      if is_uniq?(n)
        return n
      end
    end
  end

  'There is no possible number that fulfills those requirements'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements