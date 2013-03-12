require 'spec_helper'

describe BusinessUnit do

  before do
     @company = BusinessUnit.new(name: "abc company", business_unit_type: "company")
     @division = BusinessUnit.new(name: "abc division", business_unit_type: "division")
     @division2 = BusinessUnit.new(name: "abc2 division", business_unit_type: "division")
  end
  
  # validate the required fields
  describe "when business unit doesn't have name" do
    it "should be invalid" do
      @company.name=nil
      @company.should_not be_valid
      @company.errors[:name].should include("name_in_business_unit_is_null")
    end
  end

  describe "when business unit doesn't have type" do
    it "should be invalid" do
      @company.business_unit_type=nil
      @company.should_not be_valid
      @company.errors[:business_unit_type].should include("business_unit_type_in_business_unit_is_null")
    end
  end

  describe "when business has divisions" do
    it "should be able to traverse child and parent" do
      @company.should be_valid
      @company.save.should be_true
      BusinessUnit.count.should == 1
      
      @company.children << @division
      @company.should be_valid
      @company.save.should be_true
      BusinessUnit.count.should == 2

      @company.children << @division2
      @company.should be_valid
      @company.save.should be_true
      BusinessUnit.count.should == 3

      # find children and navigate to paremt
      child = BusinessUnit.find_by_name("abc division")
      child.should_not be_nil

      child.name.should == "abc division"
      child.business_unit_type.should == "division"
      child.parent.should_not be_nil
      child.parent.name.should == "abc company"
      child.parent.business_unit_type.should == "company"

      child2 = BusinessUnit.find_by_name("abc2 division")
      child2.should_not be_nil

      child2.name.should == "abc2 division"
      child2.business_unit_type.should == "division"
      child2.parent.should_not be_nil
      child2.parent.name.should == "abc company"
      child2.parent.business_unit_type.should == "company"

      # find the company
      parent = BusinessUnit.find_by_name("abc company")
      parent.children.length.should == 2
    end
  end

end
