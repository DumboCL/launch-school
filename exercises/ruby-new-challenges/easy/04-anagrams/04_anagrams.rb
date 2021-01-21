class Anagram
  def initialize(target)
    @target = target
  end

  def match(words)
    words.select { |word| anagram?(word, @target) }
  end

  private

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase

    word1.downcase.chars.sort == word2.downcase.chars.sort
  end
end