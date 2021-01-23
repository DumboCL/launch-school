class BeerSong
  STANDARD_BOTTLES = "%d bottles of beer on the wall, %d bottles of beer.\n" \
  "Take one down and pass it around, %d bottles of beer on the wall.\n".freeze
  TWO_BOTTLES = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
  "Take one down and pass it around, 1 bottle of beer on the wall.\n".freeze
  ONE_BOTTLES = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
  "Take it down and pass it around, no more bottles of beer on the wall.\n".freeze
  ZERO_BOTTLES = "No more bottles of beer on the wall, no more bottles of beer.\n" \
  "Go to the store and buy some more, 99 bottles of beer on the wall.\n".freeze

  def self.verse(num)
    case num
    when 0 then ZERO_BOTTLES
    when 1 then ONE_BOTTLES
    when 2 then TWO_BOTTLES
    else format(STANDARD_BOTTLES, num, num, num - 1)
    end
  end

  def self.verses(starting, ending)
    starting.downto(ending).map do |num|
      verse(num)
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end

# p BeerSong.verses(99, 98)