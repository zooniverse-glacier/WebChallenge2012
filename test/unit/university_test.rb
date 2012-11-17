require 'test_helper'

class UniversityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert University.new.valid?
  end
end
