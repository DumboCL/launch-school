class Trinary
  def initialize(str)
    @trinary_str = str
  end

  def to_decimal
    return 0 unless valid?

    @trinary_str.reverse.chars.map.with_index do |chr, index|
      chr.to_i * (3**index)
    end.sum
  end

  private

  def valid?
    @trinary_str.chars.all? { |chr| chr.match?(/[0-2]/) }
  end
end
