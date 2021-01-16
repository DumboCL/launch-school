class Integer
  DICTIONARY = { 1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX', 
                 10 => 'X', 40 => 'XL', 50 => 'L', 90 => 'XC', 
                 100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM',
                 1000 => 'M' }.freeze

  DIV = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].freeze

  def to_roman
    number = self
    divs = []
    DIV.each do |value|
      div, mod = number.divmod(value)
      divs << [value, div] if div.positive?
      number = mod
    end

    # p divs

    divs.map do |arr|
      DICTIONARY[arr[0]] * arr[1]
    end.join
  end
end

# p 93.to_roman
