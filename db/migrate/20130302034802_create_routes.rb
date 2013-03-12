class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|

      t.integer :origin_address_id, null: false
      t.integer :destination_address_id, null: false
      t.string :provider
      t.float :distance, null: false
      t.string :distance_unit_type, null: false
      t.string :route_type, null: false
      t.timestamp :refreshed_on, null: false

      t.timestamps
    end

    add_index :routes, [:origin_address_id, :destination_address_id, :route_type], unique: true, name: 'index_routes_on_org_and_dest_addr_ids_and_route_type_code'
  end
end
