FactoryGirl.define do
	
	factory :type_set, aliases: [:typeVan] do
		sequence(:code) { |n| "load type code" }
		sequence(:name) { |n| "load type name"}
		description "load type created for testing"
		active true
	end

   factory :type_element do
   	    typeVan
		sequence(:code) { |n| "van code" }
		sequence(:name) { |n| "van name"}
		description "van element created for testing"
		active true
	end

end