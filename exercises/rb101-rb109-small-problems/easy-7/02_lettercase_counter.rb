DOWNCASE_ALPHABET = ('a'..'z').to_a
UPPER_ALPHABET = ('A'..'Z').to_a

def letter_case_count(string)
  cate_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |char|
    if DOWNCASE_ALPHABET.include?(char)
      cate_hash[:lowercase] += 1
    elsif UPPER_ALPHABET.include?(char)
      cate_hash[:uppercase] += 1
    else
      cate_hash[:neither] += 1
    end 
  end

  cate_hash
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }