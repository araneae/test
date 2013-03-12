class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :username, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :telephone
      t.string :language_code, null: false

      # relationship to business_unit
      t.integer :business_unit_id, null: false

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
