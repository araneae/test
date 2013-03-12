class User < ActiveRecord::Base
  attr_accessible :username, :first_name, :last_name, :email, :language_code, :telephone

  username_regex = %r{^[A-Za-z\d_]+$}

  # association to business_unit
  belongs_to :business_unit

  # validation
  validates_presence_of :username, message: "username_in_user_is_null" 
  validates_format_of :username, with: username_regex, message: "username_in_user_contains_invalid_characters"
  validates_uniqueness_of :username, message: "username_in_user_already_exists"
  validates_presence_of :first_name, message: "first_name_in_user_is_null" 
  validates_presence_of :last_name, message: "last_name_in_user_is_null" 
  validates_presence_of :email, message: "email_in_user_is_null" 
  validates_presence_of :language_code, message: "language_code_in_user_is_null" 
  validates_presence_of :business_unit, message: "business_unit_in_user_is_null" 

end
