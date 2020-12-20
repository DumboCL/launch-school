require "ministest/autorun"
require "ministest/pride"

class TestExc < MiniTest::Test
  def test_empty
    assert_equal(true, list.empty?)
  end
end
