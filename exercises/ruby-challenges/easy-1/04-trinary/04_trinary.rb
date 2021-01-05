class Trinary
  def initialize(trinary_str)
    @trinary_str = trinary_str
  end

  def to_decimal
    return 0 unless @trinary_str.match?(/\b[0-2]+\b/)

    total_ammount = 0
    @trinary_str.chars.reverse.each_with_index do |chr, index|
      total_ammount += chr.to_i * (3 ** index)
    end

    total_ammount
  end
end
