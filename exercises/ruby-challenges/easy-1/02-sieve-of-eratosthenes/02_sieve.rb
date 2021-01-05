require 'benchmark'

class Sieve
  def initialize(num)
    @max = num
  end

  def primes
    return nil if @max < 2

    arr = (2..@max).to_a
    hsh = {}
    arr.each do |num|
      hsh[num] = true
    end

    arr.each do |num|
      next unless hsh[num]

      (2..@max / num).each do |n|
        hsh[num * n] = false
      end
    end
    hsh.keys.select { |key| hsh[key] }
  end
end

test_1 = Sieve.new(100_000)


Benchmark.bm do |x|
  x.report { test_1.primes }
end
