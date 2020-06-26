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

def merge_sort(arr)
  return arr if arr.size == 1
  first = arr[0, arr.size / 2]
  second = arr[arr.size / 2 .. -1]
  merge(merge_sort(first), merge_sort(second))
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]