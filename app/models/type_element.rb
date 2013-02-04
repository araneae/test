class TypeElement < ActiveRecord::Base
  attr_accessible :active, :code, :description, :name, :parent_id
end
