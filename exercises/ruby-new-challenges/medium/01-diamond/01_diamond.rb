class Diamond
  def self.make_diamond(max_letter)
    line_length = line_length(max_letter)
    first_half = ('A'...max_letter).map do |line_letter|
      center_str(line_letter).center(line_length)
    end
    (first_half + [center_str(max_letter)] + first_half.reverse).join("\n").concat("\n")
  end

  def self.center_str(letter)
    return 'A' if letter.eql?('A')

    "#{letter}#{' ' * (2 * (letter.ord - 'A'.ord) - 1)}#{letter}"
  end

  def self.line_length(max_letter)
    center_str(max_letter).size
  end
end

# p Diamond.make_diamond('B')