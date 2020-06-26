matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(matrix)
  new_row_0 = []
  new_row_1 = []
  new_row_2 = []

  matrix.each do |row|
    new_row_0 << row[0]
    new_row_1 << row[1]
    new_row_2 << row[2]
  end

  [new_row_0, new_row_1, new_row_2]
end

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]