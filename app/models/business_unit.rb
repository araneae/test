class BusinessUnit < ActiveRecord::Base

  attr_accessible :name, :business_unit_type

  # parent/child association
  has_many :children, class_name: "BusinessUnit", foreign_key: :parent_id
  belongs_to :parent, class_name: "BusinessUnit"

  # association to address
  has_many :business_unit_addresses
  has_many :addresses, through: :business_unit_address

  # association to users
  has_many :users

  # validation
  validates_presence_of :name, message: "name_in_business_unit_is_null" 
  validates_presence_of :business_unit_type, message: "business_unit_type_in_business_unit_is_null"

end
