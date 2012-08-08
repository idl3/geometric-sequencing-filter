require 'test_helper'

class GeometricSequenceTest < ActiveSupport::TestCase
  test "Geometric method on Integers" do
    assert_kind_of Module, GeometricSequence
    assert_equal 524.geometric_sequence, [512,8,4]
  end

  test "Geometric method with passkey" do
    assert_equal 11048.geometric_sequence("*2+10000"), [512,8,4]
  end

  test "Array choices to Geometric Hash" do
    assert_equal ["Biotechnology", "Computer Science", "Fine Arts", "Engineering"].to_g_hash, {2=>"Biotechnology", 4=>"Computer Science", 8=>"Fine Arts", 16=>"Engineering"}
  end

  test "View Geometric object choices" do
    geometric = GeometricSequence::Geometric.new
    assert !geometric.set_choices("Omg, This is Cool, Meow")
    p geometric.choices
    assert geometric.set_choices(["Biotechnology", "Computer Science", "Fine Arts", "Engineering"])
    p geometric.choices
  end

  test "Compare Geometric Sequence with Geometric Object Choices" do
    geometric = GeometricSequence::Geometric.new
    geometric.set_choices(["Biotechnology", "Computer Science", "Fine Arts", "Engineering"])
    assert_equal geometric.compare(10), ["Biotechnology","Fine Arts"]
  end

  test "Compare Geometric Sequence with Geometric Object Choices with PassKey" do
    geometric = GeometricSequence::Geometric.new
    geometric.set_choices(["Biotechnology", "Computer Science", "Fine Arts", "Engineering"])
    assert_equal geometric.compare(62252,"*4+62212"), ["Biotechnology","Fine Arts"]
  end
end
