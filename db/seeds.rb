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

browsers_versions = {
  "Safari" => [{name: "v5.1.2", date_opening: "2009/11/29", description: "Dernière version Mac OS X"}, {name: "v5.1.1", date_opening: "2011/10/12", description: "Avant dernière version Mac OS X"}],
  "Firefox" => [{name: "v9.0.1", date_opening: "2011/12/11", description: "Dernière version Firefox"}, {name: "v8.0", date_opening: "2011/11/08", description: "Avant dernière version Firefox"}],
  "Google Chrome" => [{name: "v16.0.912.63", date_opening: "2011/12/13", description: "Dernière version Google Chrome."}, {name: "v15.0.874", date_opening: "2011/10/27", description: "Avant dernière version Google Chrome."}],
  "Internet Explorer" => [{name: "v9.0.4", date_opening: "2011/12/22", description: "Dernière version Internet Explorer."}, {name: "v8.0", date_opening: "2009/03/19", description: "Avant dernière version Internet Explorer."}],
  "Opera" => [{name: "v11.60", date_opening: "2011/12/06", description: "Dernière version Opera."}, {name: "v11.50", date_opening: "2011/06/28", description: "Avant dernière version Opera."}]
}

browsers_versions.each do |browser_name, versions_attributes|
  browser = BrowserFamily.find_by_name(browser_name)
  versions_attributes.each do |version_attributes|
    version_attributes.merge!(browser_family_id: browser.id)
    Version.find_or_create_by_name_and_browser_family_id(version_attributes)
  end
end