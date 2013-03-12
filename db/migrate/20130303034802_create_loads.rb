class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|

      # load posted by
      t.integer :poster_user_id, null: false
      t.integer :poster_business_unit_id, null: false

      # load fulfilled by
      t.integer :carrier_business_unit_id
      t.integer :carrier_user_id

    	# origin
    	t.integer :origin_address_id, null: false

			# destination
			t.integer :destination_address_id, null: false

			# route
			t.integer :route_id, null: false
			t.boolean :is_cross_country, null: false, default: false

			# pickup 
			t.date :pickup_date, null: false
			t.integer :pickup_start_time, null: false, default: 0
			t.integer :pickup_end_time
			t.timestamp :pickup_start_time_utc, null: false
			t.timestamp :pickup_end_time_utc    
			t.boolean :is_pickup_flexible, null: false, default: false
			t.integer :pickup_flexible_days

      # delivery
			t.date :delivery_date           
			t.integer :delivery_start_time
			t.integer :delivery_end_time
			t.timestamp :delivery_start_time_utc
			t.timestamp :delivery_end_time_utc 
			t.boolean :is_delivery_flexible, null: false, default: false
			t.integer :delivery_flexible_days

			# equipments
			t.string :equipment_type, null: false
			t.text :equipment_user_comments

			# load details
			t.float :weight
			t.string :weight_unit_type, null: false
      t.float :dimension_length
			t.float :dimension_width
			t.float :dimension_height
			t.float :volume
			t.string :volume_unit_type, null: false
			t.integer :quantity, null: false, default: 1
			t.string :load_type, null: false
			t.float :ltl_feet
			t.string :status_code, null: false
			t.boolean :is_team_load, null: false, default: false

			# commodity details
			t.string :commodity_type, null: false
			t.text :commodity_user_comments

			# offer details
			t.decimal :offer_amount
			t.string :offer_currency_code, null: false 

			# contact details
			t.string :contact_name
			t.string :contact_phone
			t.string :contact_ext
			t.string :contact_email

      # repeatable
      t.boolean :is_repeat, null: false, default: false
      t.integer :repeat_num_days
      t.date :repeat_end_date

      # extra stop
      t.integer :number_extra_stop

      t.timestamps
    end

    add_index :loads, :origin_address_id
    add_index :loads, :destination_address_id
    add_index :loads, :route_id
  end
end
