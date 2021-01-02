class Series
  def initialize(str)
    @str = str.chars.map(&:to_i)
  end

  def slices(len)
    raise ArgumentError if len > @str.size

    @str.each_cons(len).to_a
  end
end