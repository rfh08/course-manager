require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(location: "666.666.666")
  end

  test "should be valid" do
    assert @location.valid?
  end
  
    test "location should be present" do
    @location.location = ""
    assert_not @location.valid?
  end
  
    test "location should not be too long" do
    @location.location = "1" * 12
    assert_not @location.valid?
  end
  
  
  test "location validation should accept valid digital" do
    valid_locations = %w[123.123.123 000.000.000 999.999.999]
    valid_locations.each do |valid_location|
      @location.location = valid_location
      assert @location.valid?, "#{valid_location.inspect} should be valid"
    end
end
  
    test "location validation should reject invalid location" do
    invalid_locations = %w[1234.1234.1234 1w1.222.3w2 11.11.11 avd.sdw.aws]
    invalid_locations.each do |invalid_location|
      @location.location = invalid_location
      assert_not @location.valid?, "#{invalid_location.inspect} should be invalid"
    end
  end
  
    test "location should be unique" do
    duplicate_location = @location.dup
    @location.save
    assert_not duplicate_location.valid?
  end
  
end
