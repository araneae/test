class CreateTypeElements < ActiveRecord::Migration
  def change
    create_table :type_elements do |t|
      t.string :code
      t.string :name
      t.string :description
      t.integer :parent_id
      t.boolean :active

      t.timestamps
    end
  end
end
