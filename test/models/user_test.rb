require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "firstname.lastname@rmit.edu.au",
                     password: "Abcd1234!", password_confirmation: "Abcd1234!")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
    test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
    test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
    test "name should not be too short" do
    @user.name = "a" * 3
    assert_not @user.valid?
  end
  
    test "email should not be too short" do
    @user.email = "a" * 3
    assert_not @user.valid?
  end
  
    test "email validation should accept valid addresses" do
    valid_addresses = %w[hi.test@rmit.edu.au Ok.itsme@rmit.edu.au well.itsright@RMIT.EDU.AU
                         BIG.SMALL@RMIT.edu.AU]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
   test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
    test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
    test "email addresses should be saved as lower-case" do
    mixed_case_email = "FIRSTNAME.LastName@RmIT.Edu.Au"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
    test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 9
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 8
    assert_not @user.valid?
  end
  
end