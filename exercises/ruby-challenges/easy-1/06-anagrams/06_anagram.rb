class Anagram
  def initialize(str)
    @str = str
  end

  def match(arr)
    arr.select { |word| word.downcase.chars.sort == @str.downcase.chars.sort }
       .reject { |word| word.downcase == @str.downcase }
  end
end