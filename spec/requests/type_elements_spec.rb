require 'spec_helper'

describe 'TypeElement' do 

    subject { page }

	before do
		@type_set = TypeSet.create code: "equipment_type", name: "Equipment Types", active: true
		@type_element = @type_set.type_elements.create code: "Van", name: "Van Equipment", active: true
	end

	describe 'create a child element' do

       it "create a child element" do
		    visit type_sets_path

		    should have_content "equipment_type"

            find("#type_set_#{@type_set.id}").click_link 'equipment_type'

            current_path.should == type_set_path(@type_set)

            should have_content "Van"

            should have_link "Add new element"

            click_link "Add new element"

            current_path.should == new_type_set_type_element_path(@type_set, @type_set.type_elements.build)

            fill_in 'Code', with: "Pickup"
            fill_in 'Name', with: "Pickup Vehicle"
            fill_in 'Description', with: "Small pickup vehicle"

            click_button "Create Element"

            should have_content "Type elemenet was successfully created."
            
            # should go back to show type_set page
            current_path.should == type_set_path(@type_set)      
            
            should have_content "Van"
            should have_content "Pickup"     
            should have_content "Pickup Vehicle"     
            should have_content "Small pickup vehicle"     
       end

       it "shouldn't create an invalid child element" do
		    visit type_sets_path

		    should have_content "equipment_type"

            find("#type_set_#{@type_set.id}").click_link 'equipment_type'

            current_path.should == type_set_path(@type_set)

            should have_content "Van"

            should have_link "Add new element"

            click_link "Add new element"

            current_path.should == new_type_set_type_element_path(@type_set, @type_set.type_elements.build)

            fill_in 'Code', with: ""

            click_button "Create Element"

            should have_content "There was an error creating the element."
            
            # should remain in the same page
            current_path.should == new_type_set_type_element_path(@type_set, @type_set.type_elements.build)    
       end

       it "should edit a child element" do
		    visit type_sets_path

		    should have_content "equipment_type"

            find("#type_set_#{@type_set.id}").click_link 'equipment_type'

            current_path.should == type_set_path(@type_set)

            should have_content "Van"

            find("#type_element_#{@type_element.id}").click_link 'Edit'

            current_path.should == edit_type_set_type_element_path(@type_set, @type_element)

            fill_in 'Code', with: ""

            click_button "Update Element"

            should have_content "There was an error while updating the element."
            
            # should remain in the same page
            current_path.should == edit_type_set_type_element_path(@type_set, @type_element)    
       end
   end
end