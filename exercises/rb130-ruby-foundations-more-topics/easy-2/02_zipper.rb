def zip(arr1, arr2)
  arr = []
  arr1.size.times do |n|
    arr << [arr1[n], arr2[n]]
  end

  arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]