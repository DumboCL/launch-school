require "minitest/autorun"
require "minitest/pride"

class TestExc < MiniTest::Test
  def test_error
    assert_raises NoExperienceError  do
      employee.hire
    end
  end

end
