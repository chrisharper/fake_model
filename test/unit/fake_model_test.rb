require File.expand_path("../../../lib/fake_model", __FILE__)
require 'test/unit'

class Person
  include FakeModel
  fake :name , :age
  validates :name , :presence => true
  validates :age , :presence => true
end

class FakeModelTest < Test::Unit::TestCase

  def test_can_initialize_with_attributes
    assert_equal 'James' , Person.new(:name => 'James').name
  end

  def test_returns_hash_of_attributes
    assert_equal Hash[name: 'James',age: nil] , Person.new(:name => 'James').attributes
  end

  def test_class_returns_array_of_faked_attributes
    assert_equal [:name,:age] , Person.fake_attributes
  end

  def test_returns_false_for_persisted?
    assert_equal false , Person.new.persisted?
  end
  
  def test_returns_true_for_new_record?
    assert_equal true , Person.new.new_record?
  end

  def test_includes_validations
    assert_equal false , Person.new.valid?
  end

end
