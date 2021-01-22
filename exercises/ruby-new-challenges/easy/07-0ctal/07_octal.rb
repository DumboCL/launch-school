class Octal
  def initialize(num_str)
    @octal_string = num_str.match?(/[^0-7]/) ? '0' : num_str
  end

  def to_decimal
    @octal_string.reverse.chars.map.with_index do |chr, index|
      chr.to_i * (8**index)
    end.sum
  end
end

# p Octal.new('1').to_decimal