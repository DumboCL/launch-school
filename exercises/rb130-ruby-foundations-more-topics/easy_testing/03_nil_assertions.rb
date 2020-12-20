require "minitest/autorun"
require "minitest/pride"

class TestExc < MiniTest::Test
  def test_nil_assertions
    assert_nil(value)
  end
end
