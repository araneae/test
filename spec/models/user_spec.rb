require 'spec_helper'

describe User do

  before do
    @company = BusinessUnit.create(name: "ABC Company", business_unit_type: "company")
    @user = User.new(username: "johnlee", first_name: "John", last_name: "Lee", email: "jlee@domain.com", language_code: "eng")
  end

  describe "when user doesn't have first name" do
    it "should be invalid" do
      @user.first_name = nil
      @user.should_not be_valid
      @user.errors[:first_name].should include("first_name_in_user_is_null")
    end
  end

  describe "when user doesn't have last name" do
    it "should be invalid" do
      @user.last_name = nil
      @user.should_not be_valid
      @user.errors[:last_name].should include("last_name_in_user_is_null")
    end
  end

  describe "when user doesn't have email" do
    it "should be invalid" do
      @user.email = nil
      @user.should_not be_valid
      @user.errors[:email].should include("email_in_user_is_null")
    end
  end

  describe "when user doesn't have language_code" do
    it "should be invalid" do
      @user.language_code = nil
      @user.should_not be_valid
      @user.errors[:language_code].should include("language_code_in_user_is_null")
    end
  end

  describe "when user is not in a business unit" do
    it "should be invalid" do
      @user.business_unit = nil
      @user.should_not be_valid
      @user.errors[:business_unit].should include("business_unit_in_user_is_null")
    end
  end

  describe "when user doesn't have username" do
    it "should be invalid" do
      @user.username = nil
      @user.should_not be_valid
      @user.errors[:username].should include("username_in_user_is_null")
    end

    it "should be invalid" do
      @user.username = "john lee"
      @user.should_not be_valid
      @user.errors[:username].should include("username_in_user_contains_invalid_characters")
    end
  end

  describe "when user doesn't have username" do
    it "should be invalid" do
      @user.username = nil
      @user.should_not be_valid
      @user.errors[:username].should include("username_in_user_is_null")
    end

    it "should be invalid format" do
      @user.username = "john lee"
      @user.should_not be_valid
      @user.errors[:username].should include("username_in_user_contains_invalid_characters")
    end
  end

  describe "when username already exists" do
    it "should be invalid" do
      @company.users << @user
      @user.should be_valid
      assert @user.save
      
      User.count.should == 1

      user2 = @user.clone
      user2.id = nil
      @company.users << user2
      user2.should_not be_valid

      assert !@user.save
      
      user2.errors[:username].should include("username_in_user_already_exists")

      User.count.should == 1
    end
  end

  describe "when user is a valid" do
    it "should be valid" do
      User.count.should == 0

      @company.users << @user
      @user.should be_valid

      assert @user.save
      
      User.count.should == 1

      # find company and look for users
      abc_company = BusinessUnit.find_by_name("ABC Company")
      abc_company.users.count == 1
    end
  end
end
