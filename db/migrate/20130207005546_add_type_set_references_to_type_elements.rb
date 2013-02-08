class AddTypeSetReferencesToTypeElements < ActiveRecord::Migration
  def change
    add_column :type_elements, :type_set_id, :integer
    add_index :type_elements, :type_set_id
  end
end
