def buy_fruit(array)
  grocery_list = []
  array.each do |pair|
    pair[1].times { grocery_list << pair[0] }
  end

  grocery_list
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]