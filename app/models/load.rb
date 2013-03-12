class Load < ActiveRecord::Base

  # load posted by
  belongs_to :poster_user, class_name: "User"
  belongs_to :poster_business_unit, class_name: "BusinessUnit"

  # load fulfilled by
  belongs_to :carrier_user, class_name: "User"
  belongs_to :carrier_business, class_name: "BusinessUnit"

	# origin
  belongs_to :origin_address, class_name: "Address"
   
  # destination
  belongs_to :destination_address, class_name: "Address"

	# route
  belongs_to :route
  attr_accessible :is_cross_country

	# pickup
	attr_accessible :pickup_date, :picup_start_time, :pickup_end_time, :pickup_start_time_utc, :pickup_end_time_utc
  attr_accessible :is_pickup_flexible, :pickup_flexible_days

  #delivery
	attr_accessible :delivery_date, :delivery_start_time, :delivery_end_time, :delivery_start_time_utc, :delivery_end_time_utc
  attr_accessible :is_delivery_flexible, :delivery_flexible_days

	# equipments
	attr_accessible :equipment_type, :equipment_user_comments

	# load details
	attr_accessible :weight, :weight_unit_type, :dimension_length, :dimension_width, :dimension_height
	attr_accessible :volume, :volume_unit_type, :quantity, :type_type, :ltl_feet, :status_code, :is_team_load

	# commodity details
	attr_accessible :commodity_type, :commodity_user_comments

	# offer details
	attr_accessible :offer_amount, :offer_currency_code

	# contact details
	attr_accessible :contact_name, :contact_phone, :contact_ext, :contact_email

  # repeatable
  attr_accessible :is_repeat, :repeat_num_days, :repeat_end_date

  # extra stop
  attr_accessible :number_extra_stop

  # validations
  validates_presence_of :poster_user_id, message: "poster_user_id_in_load_is_null" 
  validates_presence_of :poster_business_unit_id, message: "poster_business_unit_id_in_load_is_null" 
  validates_presence_of :origin_address_id, message: "origin_address_id_in_load_is_null" 
  validates_presence_of :destination_address_id, message: "destination_address_id_in_load_is_null" 
  validates_presence_of :route_id, message: "route_id_in_load_is_null" 
end
