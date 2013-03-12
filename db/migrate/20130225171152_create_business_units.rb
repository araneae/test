class CreateBusinessUnits < ActiveRecord::Migration
  def change
    create_table :business_units do |t|

      t.string :name, null: false
      t.string :business_unit_type, null: false

      # parent id for hierarchical relationship
      t.integer :parent_id

      t.timestamps
    end
  end
end
