class AddPictureToTypeElement < ActiveRecord::Migration
  def change
    add_column :type_elements, :picture, :string
  end
end
