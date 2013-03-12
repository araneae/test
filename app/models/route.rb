class Route < ActiveRecord::Base
  attr_accessible :provider, :distance, :distance_unit_type, :route_type, :refreshed_on

  belongs_to :origin_address, class_name: "Address"
  belongs_to :destination_address, class_name: "Address"

   # validation
  validates_presence_of :distance, message: "distance_in_route_is_null" 
  validates_presence_of :distance_unit_type, message: "distance_unit_type_in_route_is_null" 
  validates_presence_of :route_type, message: "route_type_in_route_is_null" 
  validates_presence_of :refreshed_on, message: "refreshed_on_in_route_is_null" 
  validates_presence_of :origin_address, message: "origin_address_in_route_is_null" 
  validates_presence_of :destination_address, message: "destination_address_in_route_is_null" 

end
