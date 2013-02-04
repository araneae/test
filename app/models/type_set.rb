class TypeSet < ActiveRecord::Base
  attr_accessible :active, :code, :description, :name

  validates :code, presence: true
end
