class Scrabble
  LETTERS = [%w[A E I O U L N R S T],
             %w[D G],
             %w[B C M P],
             %w[F H V W Y],
             %w[K],
             %w[J X],
             %w[Q Z]].freeze

  SCORES = [1, 2, 3, 4, 5, 8, 10].freeze

  def initialize(contrast)
    @contrast = contrast ? contrast.gsub(/\s*/, '').upcase : ''
    @scores = create_score_hash
  end

  def score
    @contrast.chars.map do |chr|
      @scores[chr]
    end.sum
  end

  def self.score(str)
    Scrabble.new(str).score
  end

  private

  def create_score_hash
    hsh = {}
    LETTERS.each_with_index do |arr, index|
      arr.each { |alph| hsh[alph] = SCORES[index] }
    end

    hsh
  end
end

# p Scrabble.score('alacrity')
