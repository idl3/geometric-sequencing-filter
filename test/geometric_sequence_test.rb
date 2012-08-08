require 'test_helper'

class GeometricSequenceTest < ActiveSupport::TestCase
  test "Geometric method on Integers" do
    assert_kind_of Module, GeometricSequence
    assert_equal 524.geometric_sequence, [512,8,4]
  end

  test "Geometric method with passkey" do
    assert_equal 11048.geometric_sequence("*2+10000"), [512,8,4]
  end
end
