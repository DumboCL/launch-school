class Anagram
  def initialize(str)
    @str = str
  end

  # def match(arr)
  #   arr.select { |word| word.downcase.chars.sort == @str.downcase.chars.sort }
  #      .reject { |word| word.downcase == @str.downcase }
  # end

  def match(arr)
    temp = arr.select do |word|
      if word.size != @str.size
        nil
      else
        @str.chars.all? { |chr| word.downcase.count(chr) == @str.downcase.count(chr) }
      end
    end

    temp.reject { |word| word.downcase == @str.downcase }
  end
end
