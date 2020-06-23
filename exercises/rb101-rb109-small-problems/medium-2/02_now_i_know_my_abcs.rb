BLOCKS = { 'B' => 1, 'O' => 1, 'X' => 2, 'K' => 2,
           'D' => 3, 'Q' => 3, 'C' => 4, 'P' => 4,
           'N' => 5, 'A' => 5, 'G' => 6, 'T' => 6,
           'R' => 7, 'E' => 7, 'F' => 8, 'S' => 8,
           'J' => 9, 'W' => 9, 'H' => 10, 'U' => 10,
           'V' => 11, 'I' => 11, 'L' => 12, 'Y' => 12,
           'Z' => 13, 'M' => 13 }


def block_word?(word)
  word.upcase.chars.map { |chr| BLOCKS[chr] }.uniq == word.upcase.chars.map { |chr| BLOCKS[chr] }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true