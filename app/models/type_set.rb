# == Schema Information
#
# Table name: type_sets
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  name        :string(255)
#  description :string(255)
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TypeSet < ActiveRecord::Base
  attr_accessible :active, :code, :description, :name, :picture

  validates :code, presence: true

  has_many :type_elements, dependent: :destroy
end
