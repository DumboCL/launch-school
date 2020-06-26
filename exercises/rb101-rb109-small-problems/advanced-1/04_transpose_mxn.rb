def transpose(matrix)
  new_matrix = []
  new_matrix_size = matrix[0].size

  new_matrix_size.times do |old_column|
    new_row = []

    matrix.size.times do |old_row|
      new_row << matrix[old_row][old_column]
    end

    new_matrix << new_row
  end

  new_matrix
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]