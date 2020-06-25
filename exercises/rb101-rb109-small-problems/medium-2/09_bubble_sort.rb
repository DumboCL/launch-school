def bubble_sort!(arr)
  loop do
    first = 0
    swapped = false
    loop do
      break if first == arr.size - 1
      if arr[first] > arr[first + 1]
        arr[first], arr[first + 1] = arr[first + 1], arr[first]
        swapped = true
      end

      first += 1
    end

    break unless swapped
  end

  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
