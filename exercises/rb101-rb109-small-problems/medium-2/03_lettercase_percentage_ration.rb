def letter_percentages(str)
  hsh = Hash.new(0)
  size = str.size
  hsh[:lowercase] = str.chars.count { |chr| chr =~ /[a-z]/ }
  hsh[:uppercase] = str.chars.count { |chr| chr =~ /[A-Z]/ }
  hsh[:neither] = str.chars.count { |chr| chr =~ /[^a-z]/i }

  hsh.each do |key, value|
    hsh[key] = value.to_f / size * 100
  end

  hsh
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }