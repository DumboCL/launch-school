class Series
  def initialize(str)
    @series = str.chars.map(&:to_i)
  end

  def slices(len)
    raise ArgumentError, 'the requirement exceed the size of the object' if len > @series.size

    # version 1
    # @series.each_cons(len).to_a

    # version 2
    slices = []
    0.upto(@series.length - len) do |index|
      slices << @series[index, len]
    end

    slices
  end
end
