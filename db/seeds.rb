# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


browser_families_attributes = [
  {name: "Firefox", prod_society: "Mozilla"},
  {name: "Google Chrome", prod_society: "Google"},
  {name: "Internet Explorer", prod_society: "Microsoft"},
  {name: "Safari", prod_society: "Apple"},
  {name: "Opera", prod_society: "Opera Software"}
]
browser_families_attributes.each do |attributes|
  BrowserFamily.find_or_create_by_name(attributes)
end


category_names = ["Aide/Support", "Securite", "Configuration", "Divers" ]
category_names.each do |name|
  Category.find_or_create_by_name(name: name)
end

def browser_id(name)
  browser = BrowserFamily.find_by_name(name)
  browser.id
end

version_attributes = [
  {name: "v2", date_opening: "2010/01/06", description: "Pour Mac OS X", browser_family_id: browser_id("Safari")},
  {name: "v3", date_opening: "2010/11/08", description: "Pour Mac OS X + Antiphishing", browser_family_id: browser_id("Safari")},
  {name: "v7", date_opening: "2010/10/06", description: "Pour Active X control", browser_family_id: browser_id("Internet Explorer")},
  {name: "v0.2.149", date_opening: "2002/09/08", description: "Premiere version", browser_family_id: browser_id("Google Chrome")},
  {name: "v3", date_opening: "2001/06/08", description: "8 million DL", browser_family_id: browser_id("Firefox")},
  {name: "v9.1", date_opening: "2001/01/06", description: "GeoTrust, phishTank", browser_family_id: browser_id("Opera")}]

version_attributes.each do |attributes|
  Version.create(attributes)
end