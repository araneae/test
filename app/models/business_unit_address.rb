class BusinessUnitAddress < ActiveRecord::Base
  attr_accessible :name, :address_type

  # many to many association
  belongs_to :business_unit
  belongs_to :address

  # validation
  validates_presence_of :name, message: "name_in_business_unit_address_is_null"
  validates_presence_of :address_type, message: "address_type_in_business_unit_address_is_null" 
  validates_presence_of  :business_unit, message: "business_unit_in_business_unit_address_is_null"
  validates_presence_of  :address, message: "address_in_business_unit_address_is_null"

end
