require 'spec_helper'

describe 'TypeSet' do 
	before do
        @type_set = TypeSet.create :code => "equipment_type", :description => "This set contains all equipment types", :active => true
	end

	describe "GET /type_sets" do
     	it "should display all available types" do
     		visit type_sets_path

     		page.should have_content "equipment_type"
     	end
	end

	describe "GET /type_sets/new" do
		it "should create a new type" do
			visit type_sets_path

			page.should have_content "equipment_type"

			click_link 'Create Type'

			current_path.should == new_type_set_path

			fill_in 'Code', :with => "user_type"

			click_button 'Create Type set'

			current_path.should == type_sets_path

            page.should have_content "Type was successfully created."

			page.should have_content "equipment_type"

			page.should have_content "user_type"
		end

		it "shouldn't create an invalid type" do
			visit type_sets_path

			page.should have_content "equipment_type"

			click_link 'Create Type'

			current_path.should == new_type_set_path

			fill_in 'Code', :with => ""

			click_button 'Create Type set'

			current_path.should == new_type_set_path

            page.should have_content "There was an error creating the type."
		end
	end

	describe "PUT /type_sets" do

		it "should update topic type" do
			visit type_sets_path

			page.should have_content 'equipment_type'

			find("#type_set_#{@type_set.id}").click_link 'Edit'

			fill_in 'Code', :with => 'user_type'

			click_button 'Update Type set'

			page.should have_content "The type has successfully been updated."

	  		page.should have_content "user_type"
	  	end 
	end
	
end