require "minitest/autorun"
require "minitest/pride"

class TestExc < MiniTest::Test
  def test_include
    assert_includes(list, 'xyz')
  end
end
