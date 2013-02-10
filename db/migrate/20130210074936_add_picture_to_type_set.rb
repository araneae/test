class AddPictureToTypeSet < ActiveRecord::Migration
  def change
    add_column :type_sets, :picture, :string
  end
end
