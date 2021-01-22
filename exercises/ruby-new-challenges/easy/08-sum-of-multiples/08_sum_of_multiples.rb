class SumOfMultiples
  def initialize(*nums)
    @divisors = nums
  end

  def to(exclusive_max)
    multiples = []
    @divisors.each do |divisor|
      count = 1
      while divisor * count < exclusive_max
        multiples << divisor * count
        count += 1
      end
    end

    multiples.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end
end
