class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(len)
    raise ArgumentError.new, 'the length of chunk should not be bigger than size of array' if len > @digits.size

    result = []
    (@digits.size - len + 1).times do |index|
      element_arr = []
      len.times do |round|
        element_arr << @digits[index + round]
      end
      result << element_arr
    end

    result
  end
end

# p Series.new('1234').slices(2)