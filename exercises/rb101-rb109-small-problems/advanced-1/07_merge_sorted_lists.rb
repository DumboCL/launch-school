def merge(arr1, arr2)
  i = 0
  j = 0
  new_arr = []

  while i < arr1.size or j < arr2.size
    if i < arr1.size and j < arr2.size
      if arr1[i] < arr2[j]
        new_arr << arr1[i]
        i += 1
      else
        new_arr << arr2[j]
        j += 1
      end
    elsif i < arr1.size
      new_arr << arr1[i]
      i += 1
    else
      new_arr << arr2[j]
      j += 1
    end
  end

  new_arr
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]