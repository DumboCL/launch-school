class DNA
  def initialize(base)
    @base = base
  end

  def hamming_distance(contrast)
    shorter = [@base.size, contrast.size].min
    (0..shorter - 1).map do |index|
      @base[index] == contrast[index] ? 0 : 1
    end.sum
  end
end