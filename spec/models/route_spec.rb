require 'spec_helper'

describe Route do
  before do
    @org_address = Address.create(city: "san carlos", state_code: "ca", zip_code: "12345", \
                                          country_code: "us", latitude: 123.78, longitude: 5452.67)
    @dest_address = Address.create(city: "san francisco", state_code: "ca", zip_code: "67547", \
                                          country_code: "us", latitude: 120.78, longitude: 5452.67)

    @route = Route.new(provider: "me", distance: 120.5, distance_unit_type: "ML", route_type: "RD", \
                    refreshed_on: DateTime.now)

  end

  # validate the required fields
  describe "when route doesn't have distance" do
    it "should be invalid" do
      @route.distance = nil
      @route.should_not be_valid
      @route.errors[:distance].should include("distance_in_route_is_null")
    end
  end

  describe "when route doesn't have distance unit type" do
    it "should be invalid" do
      @route.distance_unit_type = nil
      @route.should_not be_valid
      @route.errors[:distance_unit_type].should include("distance_unit_type_in_route_is_null")
    end
  end

  describe "when route doesn't have route type" do
    it "should be invalid" do
      @route.route_type = nil
      @route.should_not be_valid
      @route.errors[:route_type].should include("route_type_in_route_is_null")
    end
  end

  describe "when route doesn't have refreshed on" do
    it "should be invalid" do
      @route.refreshed_on = nil
      @route.should_not be_valid
      @route.errors[:refreshed_on].should include("refreshed_on_in_route_is_null")
    end
  end

  describe "when route doesn't have origin address" do
    it "should be invalid" do
      @route.origin_address = @org_address
      @route.should_not be_valid
      @route.errors[:destination_address].should include("destination_address_in_route_is_null")
    end
  end

  describe "when route doesn't have destination address" do
    it "should be invalid" do
      @route.destination_address = @destination_address
      @route.should_not be_valid
      @route.errors[:origin_address].should include("origin_address_in_route_is_null")
    end
  end

  describe "when route is from origin to destination" do
    it "should be valid" do
      Route.count.should == 0
      @route.origin_address = @org_address
      @route.destination_address = @dest_address
      @route.should be_valid
      assert @route.save
      Route.count.should == 1

      # find the route
      saved_route = Route.find(@route.id)
      saved_route.provider.should == "me"
      saved_route.distance.should == 120.5
      saved_route.distance_unit_type.should == "ML"
      saved_route.route_type = "RD"

      saved_route_org_address = saved_route.origin_address
      saved_route_dest_address = saved_route.destination_address
      saved_route_org_address.id.should == @org_address.id
      saved_route_dest_address.id.should == @dest_address.id
    end
  end
end
