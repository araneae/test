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

require 'spec_helper'

describe TypeSet do
  pending "add some examples to (or delete) #{__FILE__}"
end
