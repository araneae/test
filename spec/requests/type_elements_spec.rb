require 'spec_helper'

describe 'TypeElement' do 

    subject { page }

	before do
		@type_set = TypeSet.create code: "equipment_type", name: "Equipment Types", active: true
		@type_element = @type_set.type_elements.create code: "VAN", name: "Van Equipment", active: true
	end

	describe 'create child elements' do

       it "should create a new element" do

		    visit type_sets_path

		    should have_content "equipment_type"

            find("#type_set_#{@type_set.id}").click_link 'equipment_type'

            current_path.should == type_set_path(@type_set)

            should have_content "VAN"

            #current_path.should == new_type_set_type_element(@type_set)
       end
	end
end