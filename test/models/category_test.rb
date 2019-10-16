require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Example category")
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = ""
    assert_not @category.valid?
  end

    test "name should not be too long" do
    @category.name = "a" * 31
    assert_not @category.valid?
  end
  
    test "name should be unique" do
    duplicate_category = @category.dup
    duplicate_category.name = @category.name.upcase
    @category.save
    assert_not duplicate_category.valid?
  end
  
end
