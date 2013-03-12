require 'spec_helper'

describe Address do
  # attributes are being tested:
  # :hash_key, :street, :street2, :city, :state, :zip_code, :country, :country_code,:latitude, :longitude
  
  before do
     @address = Address.new(street: "123 abc road", street2: "apt 2", city: "san carlos", state: "california", zip_code: "12345", \
                                          country: "united states", country_code: "us", latitude: 123.78, longitude: 5452.67)
  end

  # validate the required fields
  describe "when address doesn't have city" do
    it "should be invalid" do
      @address.city = nil
      @address.should_not be_valid
      @address.errors[:city].should include("city_in_address_is_null")
    end
  end

  describe "when address doesn't have state" do
    it "should be invalid" do
      @address.state = nil
      @address.should_not be_valid
      @address.errors[:state].should include("state_in_address_is_null")
    end
  end

  describe "when address doesn't have country" do
    it "should be invalid" do
      @address.country = nil
      @address.should_not be_valid
      @address.errors[:country].should include("country_in_address_is_null")
    end
  end

  describe "when address doesn't have country code" do
    it "should be invalid" do
      @address.country_code = nil
      @address.should_not be_valid
      @address.errors[:country_code].should include("country_code_in_address_is_null")
    end
  end
  
  describe "when has same address" do
    it "should be invalid" do
      @address.should be_valid
      @address.save.should be_true

      Address.count.should == 1

      address2 = Address.new(street: "123 ABC    Road", street2: "APT 2", city: "San Carlos", state: "California",  \
                                 country: "united states of america", country_code: "us", zip_code: "12345", latitude: 123.78, longitude: 5452.67)
      address2.should be_valid      

      lambda {
        address2.save
      }.should raise_error ActiveRecord::StatementInvalid

      Address.count.should == 1
    end
  end

  describe "when address has unwanted spaces" do
    it "should be squeezed" do
      @address.should be_valid
      @address.save.should be_true

      Address.count.should == 1

      saved_address = Address.find(1)

      saved_address.street.should == "123 Abc Road"
      saved_address.street2.should == "Apt 2"
      saved_address.city.should == "San Carlos"
      saved_address.state.should == "CALIFORNIA"
      saved_address.country.should == "UNITED STATES"
      saved_address.country_code.should == "US"
      saved_address.zip_code.should == "12345"
      saved_address.latitude.should == 123.78
      saved_address.longitude.should == 5452.67
    end
  end

  describe "when address is in US zip_code" do
    it "should be invalid" do
      @address.country_code="us"
      @address.zip_code="123456"
      @address.should be_invalid
      @address.save.should be_false
      @address.errors[:zip_code].should include("zip_code_format_in_address_is_invalid_for_us")
    end

    it "should be valid" do
      @address.country_code="us"
      @address.zip_code="12345"
      @address.should be_valid
      @address.save.should be_true
      
      Address.count.should == 1
    end
  end

  describe "when address is in CN zip_code" do
    it "should be invalid" do
      @address.country_code="cn"
      @address.zip_code="D6G 5A6"
      @address.should be_invalid
      @address.save.should be_false
      @address.errors[:zip_code].should include("zip_code_format_in_address_is_invalid_for_cn")
    end

    it "should be valid" do
      @address.country_code="cn"
      @address.zip_code="H0H 0H0"
      @address.should be_valid
      @address.save.should be_true
      
      Address.count.should == 1
    end
  end

  describe "when address is in IN zip_code" do
    it "should be invalid" do
      @address.country_code="in"
      @address.zip_code="7861255"
      @address.should be_invalid
      @address.save.should be_false
      @address.errors[:zip_code].should include("zip_code_format_in_address_is_invalid_for_in")
    end

    it "should be valid" do
      @address.country_code="in"
      @address.zip_code="786125"
      @address.should be_valid
      @address.save.should be_true
      
      Address.count.should == 1
    end
  end

end