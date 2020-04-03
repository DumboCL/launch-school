def show_multiplicative_average(array)
  product_result = 1
  array.each do |number|
    product_result *= number
  end

  avarage = product_result.to_f / array.size
  sprintf("%0.3f", avarage)
end

puts show_multiplicative_average([3, 5]) == '7.500'
puts show_multiplicative_average([6]) == '6.000'
puts show_multiplicative_average([2, 5, 7, 11, 13, 17]) == '28361.667'
