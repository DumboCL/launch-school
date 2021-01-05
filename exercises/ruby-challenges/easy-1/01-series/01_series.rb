class Series
  def initialize(str)
    @nums = str.chars.map(&:to_i)
  end

  def slices(len)
    raise ArgumentError, 'the requested length is bigger than length of string' if len > @nums.size

    @nums.each_cons(len).to_a
  end
end
