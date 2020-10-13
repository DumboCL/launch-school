def reduce(array, start=nil)
  result = nil
  result = start ? start : array.shift

  array.each do |ele|
    result = yield(result, ele)
  end

  result
end


array = [1, 2, 3, 4, 5]
p reduce(array) { |acc, num| acc + num }                    # => 15

array = [1, 2, 3, 4, 5]
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
