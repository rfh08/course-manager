require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:jack)
    # This code is not idiomatically correct.
    # @course = Course.new(name: "Hi Project",prerequisite: "Hello Project",
    # description: "This is to practise what you have learnt and work with real world industry partner.
    # The aim is to experience the full life cycle of application development of a commercial level product",
    # category_id: @category.id, location_id: @location.id ,user_id: @user.id)
    
    
    @course =  @user.courses.build(name: "Hi Project",prerequisite: "Hello Project",
    description: "This is to practise what you have learnt and work with real world industry partner.
    The aim is to experience the full life cycle of application development of a commercial level product")
  end

  test "should be valid" do
    assert @course.valid?
  end
  
  test "name should be present" do
    @course.name = " "
    assert_not @course.valid?
  end

  test "prerequisite should be present" do
    @course.prerequisite = " "
    assert_not @course.valid?
  end
  
    test "description should be present" do
    @course.description = " "
    assert_not @course.valid?
  end

  test "user id should be present" do
    @course.user_id = nil
    assert_not @course.valid?
  end
  
    test "description should be at least 30 characters" do
    @course.description = "a" * 29
    assert_not @course.valid?
  end
  
    test "name should be at least 10 characters" do
    @course.name =  "a" * 9
    assert_not @course.valid?
  end
  
    test "prerequisite should be at least 10 characters" do
    @course.prerequisite =  "a" * 9
    assert_not @course.valid?
  end
 
 
end