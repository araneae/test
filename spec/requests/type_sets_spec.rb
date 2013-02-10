require 'spec_helper'

describe 'TypeSet' do 

	subject { page }

	before do
        @type_set = TypeSet.create code: "equipment_type", description: "This set contains all equipment types", active: true
	end

	describe "GET /type_sets" do
		before { visit type_sets_path }
     	
     	it { should have_content "equipment_type" }
	end

	describe "GET /type_sets/new" do
		it "should create a new type" do
			visit type_sets_path

			should have_content "equipment_type"

			click_link 'Add a new Type'

			current_path.should == new_type_set_path

			should have_link 'Back'

			fill_in 'Code', with: "user_type"

			click_button 'Create Type'

			current_path.should == type_sets_path

            should have_content "Type was successfully created."

			should have_content "equipment_type"

			should have_content "user_type"
		end

		it "shouldn't create an invalid type" do
			visit type_sets_path

			should have_content "equipment_type"

			click_link 'Add a new Type'

			current_path.should == new_type_set_path

			fill_in 'Code', with: ""

			click_button 'Create Type'

			current_path.should == new_type_set_path

            should have_content "There was an error creating the type."
		end
	end

	describe "PUT /type_sets" do

		it "should update topic type" do
			visit type_sets_path

			should have_content 'equipment_type'

			find("#type_set_#{@type_set.id}").click_link 'Edit'

            should have_content 'Edit Type'

			should have_link 'Back'

			fill_in 'Code', with: 'user_type'

			click_button 'Update Type'

			should have_content "The type has successfully been updated."

	  		should have_content "user_type"
	  	end 
	end

	describe "GET /type_sets/id/show" do

		it "should show topic type" do
			visit type_sets_path

			should have_content 'equipment_type'

			find("#type_set_#{@type_set.id}").click_link 'equipment_type'

			current_path.should == type_set_path(@type_set)

			should have_content 'Type Details'

			should have_link 'Back'
	  	end 
	end
	
end