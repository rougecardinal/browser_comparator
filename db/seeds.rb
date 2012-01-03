# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


BrowserFamily.find_or_create_by_name(:name => "Firefox", :prod_society => "Mozilla")
BrowserFamily.find_or_create_by_name(:name => "Google Chrome", :prod_society => "Google")
BrowserFamily.find_or_create_by_name(:name => "Internet Explorer", :prod_society => "Microsoft")
BrowserFamily.find_or_create_by_name(:name => "Safari", :prod_society => "Apple")
BrowserFamily.find_or_create_by_name(:name => "Opera", :prod_society => "Opera Software")