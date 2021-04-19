#               user     system      total        real
# solution 1 29.732997   0.073781  29.806778 ( 29.917747)
# solution 2  0.066239   0.002278   0.068517 (  0.068695)
# solution 3 87.615330   0.150062  87.765392 ( 87.926654)
# solution 4  3.083823   0.014510   3.098333 (  3.121124)

require 'benchmark'

class Sieve
  def initialize(num)
    @max = num
  end

  def primes
    primes_solution4
  end

  # the third best
  def primes_solution1
    (2..@max).select do |num|
      prime?(num)
    end
  end

  # the best solution
  def primes_solution2
    return nil if @max < 2

    arr = (2..@max).to_a
    hsh = {}
    arr.each { |num| hsh[num] = true }

    arr.each do |num|
      next unless hsh[num]

      (2..@max / num).each { |n| hsh[num * n] = false }
    end

    hsh.keys.select { |key| hsh[key] }
  end

  # the worst
  def primes_solution3
    return nil if @max < 2

    candidates = (2..@max).to_a

    candidates.each do |candidate|
      multiple = 2

      loop do
        break if candidate * multiple > candidates.max

        candidates.delete(candidate * multiple)
        multiple += 1
      end
    end

    candidates
  end

  # the second best
  def primes_solution4
    return nil if @max < 2

    candidates = (2..@max).to_a
    primes = []

    until candidates.empty?
      next_prime = candidates.shift
      primes << next_prime
      candidates.reject! { |num| (num % next_prime).zero? }
    end

    primes
  end

  protected

  def prime?(num)
    return false if num < 2

    2.upto(num - 1) do |divisor|
      return false if (num % divisor).zero?
    end

    true
  end
end

test1 = Sieve.new(100_000)

Benchmark.bm do |x|
  x.report('solution 1') { test1.primes_solution1 }
  x.report('solution 2') { test1.primes_solution2 }
  x.report('hash solution') { test1.primes_solution3 }
  x.report('solution 4') { test1.primes_solution4 }
end
