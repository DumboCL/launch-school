class PerfectNumber
  def self.classify(num)
    raise StandardError, 'the number must be positive' if num <= 0
    
    sum = sum_of_factors(num)
    if sum == num
      'perfect'
    elsif sum < num
      'deficient' 
    else
      'abundant'
    end
  end

  def self.sum_of_factors(num)
    (1..num / 2).select { |div| (num % div).zero? }.sum
  end
end