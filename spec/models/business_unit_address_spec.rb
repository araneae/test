require 'spec_helper'

describe BusinessUnitAddress do
  
  before do
    @company = BusinessUnit.create(name: "ABC Company", business_unit_type: "company")
    @address = Address.create(street: "123 abc road", street2: "apt 2", city: "san carlos", state_code: "ca", zip_code: "12345", \
                                          country_code: "us", latitude: 123.78, longitude: 5452.67)
    @billing_address = BusinessUnitAddress.new(name: "billing address", address_type: "billing_address")
  end

  describe "when business unit address doesn't have a name" do
    it "should be invalid" do
      @billing_address.name = nil
      @billing_address.should_not be_valid
      @billing_address.errors[:name].should include("name_in_business_unit_address_is_null")
    end
  end

  describe "when business unit address doesn't have a name" do
    it "should be invalid" do
      @billing_address.address_type = nil
      @billing_address.should_not be_valid
      @billing_address.errors[:address_type].should include("address_type_in_business_unit_address_is_null")
    end
  end

  describe "when business unit address doesn't have an address" do
    it "should be invalid" do
      @company.business_unit_addresses << @billing_address
      @billing_address.should_not be_valid
      @billing_address.errors[:address].should include("address_in_business_unit_address_is_null")
    end
  end

  describe "when business unit address doesn't have a business unit" do
    it "should be invalid" do
      @billing_address.address = @address
      @billing_address.should_not be_valid
      @billing_address.errors[:business_unit].should include("business_unit_in_business_unit_address_is_null")
    end
  end

  describe "when business unit address is billing address" do
    it "should be valid" do
      BusinessUnitAddress.count.should == 0

      @company.business_unit_addresses << @billing_address
      @billing_address.address = @address
      @billing_address.should be_valid
      assert @billing_address.save
      
      BusinessUnitAddress.count.should == 1
    end
  end

end
