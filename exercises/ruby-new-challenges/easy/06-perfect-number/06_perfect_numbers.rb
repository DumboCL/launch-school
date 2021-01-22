class PerfectNumber
  def self.classify(num)
    raise StandardError, 'the number must be positive' if num <= 0

    divisors_sum = divisors(num).sum
    return 'perfect' if divisors_sum == num
    return 'abundant' if divisors_sum > num
    return 'deficient' if divisors_sum < num
  end

  def self.divisors(num)
    (1..num / 2).select do |divisor|
      (num % divisor).zero?
    end
  end
end
