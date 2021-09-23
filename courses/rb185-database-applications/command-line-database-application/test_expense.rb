require 'minitest/autorun'
require 'minitest/pride'

load 'expense'

class TestExpense < Minitest::Test
  def setup
    @cli = CLI.new
  end

  def test_cli_run
    assert_equal 1, 1
  end
end