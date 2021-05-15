class Octal
  def initialize(octal_str)
    @octal_str = octal_str
  end

  def to_decimal
    return 0 if invalid?

    @octal_str.chars.reverse.map.with_index do |chr, index|
      chr.to_i * 8**index
    end.sum
  end

  protected

  def invalid?
    @octal_str.match?(/[^0-7]/)
  end
end
