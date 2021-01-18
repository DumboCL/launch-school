LETTERS = [%w[A E I O U L N R S T], 
           %w[D G],
           %w[B C M P],
           %w[F H V W Y],
           %w[K],
           %w[J X],
           %w[Q Z]].freeze

VALUES = [1, 2, 3, 4, 5, 8, 10].freeze

def dictionary
  hsh = {}
  LETTERS.each_with_index do |group, index|
    group.each { |key| hsh[key] = VALUES[index] }
  end

  hsh
end

DICTIONARY = dictionary.freeze

class Scrabble
  def initialize(str)
    @str = str ? str.gsub(/\s+/, '').upcase : ''
  end

  def score
    @str.chars.map do |chr|
      DICTIONARY[chr]
    end.sum
  end

  def self.score(str)
    str.upcase.chars.map do |chr|
      DICTIONARY[chr]
    end.sum
  end
end

