class RomanNumeral
  DICTIONARY = { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 
    10 => 'X', 40 => 'XL', 50 => 'L', 90 => 'XC', 
    100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM',
    1000 => 'M' }.freeze

  DIV = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].freeze

  def initialize(num)
    @num = num
  end

  def to_roman
    div_mod = []
    remainder = @num
    DIV.each do |div|
      result, remainder = remainder.divmod(div)
      div_mod << [div, result] if result.positive?
    end

    div_mod.map do |root, numbers|
      DICTIONARY[root] * numbers
    end.join
  end
end

# p RomanNumeral.new(1).to_roman