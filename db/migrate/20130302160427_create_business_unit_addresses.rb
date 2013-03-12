class CreateBusinessUnitAddresses < ActiveRecord::Migration
  def change
    create_table :business_unit_addresses do |t|

      t.string :name, null: false
      t.string :address_type, null: false

      # many to many relationship
      t.integer :business_unit_id, null: false
      t.integer :address_id, null: false

      t.timestamps
    end

    add_index :business_unit_addresses, [:business_unit_id, :address_id, :name], unique: true, name: 'index_bus_unit_addr_on_bus_unit_id_and_address_id_and_name'
  end
end
