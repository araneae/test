class Address < ActiveRecord::Base
  attr_accessible :hash_key, :street, :street2, :city, :state_code, :zip_code
  attr_accessible :country_code, :address, :latitude, :longitude

  zip_regex_usa = %r{^\d{5}(-\d{4})?$}
  zip_regex_canada = %r{[ABCEGHJKLMNPRSTVXY]\d[A-Z] \d[A-Z]\d}
  zip_regex_india = %r{^\d{6}?$}

  # validation
  validates_presence_of :city, message: "city_in_address_is_null" 
  validates_presence_of :state_code, message: "state_code_in_address_is_null" 
  validates_presence_of :country_code, message: "country_code_in_address_is_null" 
  validates :hash_key, uniqueness: true
  validates_format_of :zip_code, allow_blank: true, with: zip_regex_usa, :if => :address_in_usa?, message: "zip_code_format_in_address_is_invalid_for_us" 
  validates_format_of :zip_code, allow_blank: true, with: zip_regex_canada, :if => :address_in_canada?, message: "zip_code_format_in_address_is_invalid_for_cn" 
  validates_format_of :zip_code, allow_blank: true, with: zip_regex_india, :if => :address_in_india?, message: "zip_code_format_in_address_is_invalid_for_in" 

  before_save :handle_before_save

  # helper methods
  def generate_hash
    generate_address_field
    address_string=''
    address_string=address.downcase unless address.blank?
    self.hash_key=nil if address_string.blank?
    self.hash_key=Digest::MD5.hexdigest(address_string) unless address_string.blank?
  end 

  private

  def handle_before_save
    squeeze_fields
    generate_hash
  end 

  def squeeze_fields
    self.street=self.street.squeeze(' ') unless self.street.blank?
    self.street2=self.street2.squeeze(' ') unless self.street2.blank?
    self.city=self.city.squeeze(' ') unless self.city.blank?
    self.state_code=self.state_code.upcase.squeeze(' ') unless self.state_code.blank?
    self.zip_code=self.zip_code.upcase.squeeze(' ') unless self.zip_code.blank?
    self.country_code=self.country_code.upcase.squeeze(' ') unless self.country_code.blank?
  end

  def generate_address_field
    self.address=''
    self.address<<self.street unless self.street.blank?
    self.address<< ', ' unless self.address.blank? or self.street2.blank?
    self.address<<self.street2 unless self.street2.blank?
    self.address<< ', ' unless self.address.blank? or self.city.blank?
    self.address<<self.city unless self.city.blank?
    self.address<< ', ' unless self.address.blank? or self.state_code.blank?
    self.address<<self.state_code unless self.state_code.blank? 
    self.address<< ' ' unless self.address.blank? or self.zip_code.blank?
    self.address<<self.zip_code unless self.zip_code.blank?
    self.address<< ', ' unless self.address.blank? or self.country_code.blank?
    self.address<<self.country_code unless self.country_code.blank?
    self.address=self.address.squeeze(' ') unless self.address.blank?
  end

  def address_in_usa?
    'US'.casecmp(self.country_code) == 0 unless self.country_code.blank?
  end

  def address_in_canada?
    'CN'.casecmp(self.country_code) == 0 unless self.country_code.blank?
  end

  def address_in_india?
    'IN'.casecmp(self.country_code) == 0 unless self.country_code.blank?
  end
end
