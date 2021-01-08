class DNA
  def initialize(base)
    @base = base
  end

  def hamming_distance(dna)
    size = dna.size
    @base[0, size].chars.select.with_index do |chr, index|
      chr != dna[index]
    end.count
  end
end