require "minitest/autorun"
require "minitest/pride"

class TestExc < MiniTest::Test
  def test_value_odd
    assert_equal(false, !value.odd?)
  end
end
