class Truck < ActiveRecord::Base

    attr_accessible :name, :equipment_code
    attr_accessible :license_number, :city_registered, :state_registered, :country_registered
    attr_accessible :vin, :engine_number, :chassis_number, :number_axles
    attr_accessible :load_capacity, :load_capacity_unit_code
    attr_accessible :length, :width, :height

    # validations
    # TBD: operation permit specific details, like usdot, mc#, are to be added 
    # TBD: more details about load bearing capacity and commodity types are to be added
end
