require_relative 'test_helper'

class AdaNumbersTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AdaTruthy::VERSION
  end
end
