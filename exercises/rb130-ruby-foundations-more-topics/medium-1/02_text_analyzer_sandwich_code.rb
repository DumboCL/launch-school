class TextAnalyzer
  def process
    return unless block_given?

    hsh = Hash.new(0)
    file = File.open("02_text_analyzer_sandwich_code.txt")
    file_text = file.readlines

    hsh[:lines] = file_text.size
    hsh[:paragraphs] = file_text.join.split("\n\n").size
    hsh[:sentence] = file_text.join.split(/(?<=\.)/).size
    hsh[:words] = file_text.map(&:chomp)
      .map(&:split)
      .map(&:size)
      .sum

    file.close
    yield(hsh)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |data| puts "#{data[:paragraphs]} paragraphs" }
analyzer.process { |data| puts "#{data[:lines]} lines" }
analyzer.process { |data| puts "#{data[:words]} words" }
analyzer.process { |data| puts "#{data[:sentence]} sentence" }
