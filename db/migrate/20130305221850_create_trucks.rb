class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|

      t.string :name, null: false
      t.string :equipment_type, null: false

      # ownership and status
      t.integer :business_unit_id, null: false
      t.string :status_code, null: false

      # registration specific
      t.string :registration_number, null: false
      t.date :registered_on, null: false
      t.date :registration_expires_on, null: false
      t.string :city_registered
      t.string :state_registered, null: false
      t.string :country_registered, null: false
      t.string :registration_authority, null: false
      t.boolean :is_registration_renewable, null: false, default: true

      # insurance specific
      t.string :insurance_number, null: false
      t.date :insuranced_on, null: false
      t.date :insuranced_expires_on, null: false
      t.string :insurance_provider, null: false
      t.string :insurance_provider_address_id, null: false

      # vehicle specific
      t.string :vin
      t.string :engine_number
      t.string :chassis_number
      t.integer :number_axles
      t.float :max_load
      t.float :empty_weight
      t.float :gross_max_weight
      t.string :weight_unit_type
      t.float :length
      t.float :width
      t.float :height
      t.string :volume_unit_type
      t.float  :floor_space
      t.string :floor_space_unit_type

      # driver specific
      t.string :driver_full_name
      t.string :driver_license_number
      t.date :driver_license_expires_on

      # auditing related
      t.string :created_by
      t.string :modified_by

      t.timestamps
    end
  end
end
