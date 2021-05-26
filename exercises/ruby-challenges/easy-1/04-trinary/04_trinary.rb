# frozen_string_literal: true

# Trinary
class Trinary
  def initialize(str)
    @tri_str = str
  end

  def to_decimal
    return 0 unless valid?

    @tri_str.chars.reverse.map(&:to_i).map.with_index do |num, index|
      num * 3**index
    end.sum
  end

  private

  def valid?
    @tri_str.chars.all? { |chr| chr.match?(/[0-2]/) }
  end
end

# extra exercise from the video
class Hex
  # HEX_DIC = {
  #   '1' => 1, '2' => 2, '3' => 3,
  #   '4' => 4, '5' => 5, '6' => 6,
  #   '7' => 7, '8' => 8, '9' => 9,
  #   '0' => 0, 'a' => 10, 'b' => 11,
  #   'c' => 12, 'd' => 13, 'e' => 14,
  #   'f' => 15
  # }

  HEX_DIC = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f].freeze

  def initialize(str)
    @hex_str = str
  end

  def to_decimal
    return 0 unless valid?

    @hex_str.chars.reverse.map.with_index do |chr, index|
      HEX_DIC.index(chr.downcase) * 16**index
    end.sum
  end

  private

  def valid?
    @hex_str.chars.all? { |chr| chr.match?(/[0-9A-F]/i) }
  end
end

# p Hex.new('1E42').to_decimal # => 7746
