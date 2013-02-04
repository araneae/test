class CreateTypeSets < ActiveRecord::Migration
  def change
    create_table :type_sets do |t|
      t.string :code
      t.string :name
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
