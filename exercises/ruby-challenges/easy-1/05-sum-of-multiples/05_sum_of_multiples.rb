class SumOfMultiples
  attr_reader :divs

  @@divs = [3, 5]

  def initialize(*nums)
    @divs = nums.empty? ? [3, 5] : nums
  end

  def to(number)
    (1...number).select do |num|
      @divs.any? { |div| (num % div).zero? }
    end.sum
  end

  def self.to(number)
    (1...number).select do |num|
      @@divs.any? { |div| (num % div).zero? }
    end.sum
  end
end
