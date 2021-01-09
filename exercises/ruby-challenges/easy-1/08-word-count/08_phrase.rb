class Phrase
  def initialize(str)
    @str = str
  end

  def word_count
    hsh = Hash.new(0)
    # @str.downcase.scan(/'?\b[a-z'0-9]+\b'?/).each { |word| hsh[word] += 1 }
    @str.downcase.scan(/\b[a-z'0-9]+\b/).each { |word| hsh[word] += 1 }
    hsh
  end
end
