class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :hash_key, null: false
      t.string :street
      t.string :street2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code
      t.string :country, null: false
      t.string :country_code, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :addresses, :hash_key, unique: true
  end
end
