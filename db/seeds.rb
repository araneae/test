# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'    

CSV.foreach('db/us_cities.csv', :headers => true) do |row|
  #puts row.to_hash
  row_map=row.to_hash
  begin
    Address.create!(city: row_map["AccentCity"], state_code: row_map["Region"], country_code: row_map["Country"], latitude: row_map["Latitude"], longitude: row_map["Longitude"])
  rescue ActiveRecord::StatementInvalid
    puts "ActiveRecord::StatementInvalid in record #{row.to_hash}"
  end
end