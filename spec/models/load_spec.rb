require 'spec_helper'

describe Load do
  
  before do
    @load = FactoryGirl.build(:load)
  end
  
  describe "when load doesn't have poster user id" do
    it "should be invalid" do
      @load.should_not be_valid
      @load.errors[:poster_user_id].should include("poster_user_id_in_load_is_null")
    end
  end

  describe "when load doesn't have poster business id" do
    it "should be invalid" do
      @load.should_not be_valid
      @load.errors[:poster_business_unit_id].should include("poster_business_unit_id_in_load_is_null")
    end
  end

  describe "when load doesn't have origin address" do
    it "should be invalid" do
      @load.should_not be_valid
      @load.errors[:origin_address_id].should include("origin_address_id_in_load_is_null")
    end
  end

  describe "when load doesn't have destination address" do
    it "should be invalid" do
      @load.should_not be_valid
      @load.errors[:destination_address_id].should include("destination_address_id_in_load_is_null")
    end
  end

  describe "when load doesn't have route id" do
    it "should be invalid" do
      @load.should_not be_valid
      @load.errors[:route_id].should include("route_id_in_load_is_null")
    end
  end

  # Additional test cases
  # - Validate that a valid load can be saved and retrieved from database (need valid user, business unit, addresses and routes)
  # - Validate the the auto populated fields are being populated after saving a load (all fields which are null and have default values)
  # - Searching exixting loads by user, business unit, origin address, destination address or by route
  # - Validate that UTC pickup/delivery fields are computed based non-utc fields and saved in database
  
end
