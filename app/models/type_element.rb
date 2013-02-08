# == Schema Information
#
# Table name: type_elements
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  name        :string(255)
#  description :string(255)
#  parent_id   :integer
#  active      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TypeElement < ActiveRecord::Base
  attr_accessible :active, :code, :description, :name

  belongs_to :type_set

  has_many :children, class_name: "TypeElement"
  belongs_to :parent, class_name: "TypeElement", foreign_key: 'parent_id'

  def children
    TypeElement.find(:all, conditions: ['parent_id=?', id])
  end

end
