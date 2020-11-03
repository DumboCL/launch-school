require "minitest/autorun"
require "minitest/pride"

class TestExc < MiniTest::Test
  def test_equality
    assert_equal('xyz', value.downcase)
  end
end
