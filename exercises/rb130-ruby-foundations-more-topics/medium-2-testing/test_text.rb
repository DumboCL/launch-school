require 'minitest/autorun'
require 'minitest/pride'

require_relative 'classes/text'

class TestText < Minitest::Test
  def setup
    @file = File.open('classes/text.txt')
    @file_text = @file.read
    @text = Text.new(@file_text)
  end

  def test_swap
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected_text, @text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
