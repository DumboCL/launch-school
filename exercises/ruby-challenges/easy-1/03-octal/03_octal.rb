class Octal
  def initialize(octal_str)
    @octal_str = octal_str
  end

  def to_decimal
    return 0 unless @octal_str.match?(/\b[0-7]+\b/)

    base_amount = 0
    @octal_str.chars.reverse.each_with_index do |chr, index|
      base_amount += chr.to_i * (8 ** index)
    end

    base_amount
  end
end

# p some = Octal.new('73').to_decimal
