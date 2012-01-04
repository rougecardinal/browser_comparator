# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


browser_families_attributes = [
  {:name => "Firefox", :prod_society => "Mozilla"}, 
  {:name => "Google Chrome", :prod_society => "Google"},
  {:name => "Internet Explorer", :prod_society => "Microsoft"},
  {:name => "Safari", :prod_society => "Apple"},
  {:name => "Opera", :prod_society => "Opera Software"}
]


browser_families_attributes.each do |attributes|
  BrowserFamily.find_or_create_by_name(attributes)
end

category_names = ["Aide/Support", "Securite", "Configuration", "Divers" ]

category_names.each do |name|
  Category.find_or_create_by_name(name: name)
end
