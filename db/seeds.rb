# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# BROWSERS.
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

#VERSIONS.
browsers_versions = {
  "Safari" => [{name: "5", date_opening: " 2009/11/29", description: "Dernière version Mac OS X"}, {name: "4", date_opening: "2011/10/12", description: "Avant dernière version Mac OS X"}],
  "Firefox" => [{name: "9", date_opening: "2011/12/11", description: "Dernière version Firefox"}, {name: "8", date_opening: "2011/11/08", description: "Avant dernière version Firefox"}],
  "Google Chrome" => [{name: "16", date_opening: "2011/12/13", description: "Dernière version Google Chrome."}, {name: "15", date_opening: "2011/10/27", description: "Avant dernière version Google Chrome."}],
  "Internet Explorer" => [{name: "9", date_opening: "2011/12/22", description: "Dernière version Internet Explorer."}, {name: "8", date_opening: "2009/03/19", description: "Avant dernière version Internet Explorer."}],
  "Opera" => [{name: "11", date_opening: "2011/12/06", description: "Dernière version Opera."}, {name: "10", date_opening: "2011/06/28", description: "Avant dernière version Opera."}]
}

browsers_versions.each do |browser_name, versions_attributes|
  browser = BrowserFamily.find_by_name(browser_name)
  versions_attributes.each do |version_attributes|
    version_attributes.merge!(browser_family_id: browser.id)
    Version.find_or_create_by_name_and_browser_family_id(version_attributes)
  end
end

#OS.
os_names = [ "Windows 7", "Windows Vista", "Windows XP", "Mac OS Lion", "Mac OS Snow Leopard", "Mac OS Leopard", "Linux Ubuntu", "Linux Autres"]
    
os_names.each do |attribute|
  Os.find_or_create_by_name(attribute)
end

#OS VERSION.

puts "Association des versions et des os"

linux = Os.find_by_name("Linux Ubuntu")

#versions_in_browsers = {"Google Chrome" => ["v16","v15"], "Safari" => ["v5","v4"]}

versions_in_browsers = {
  "Windows 7" => {
      "Google Chrome" => ["16", "15"],
      "Safari" => ["5", "4"]
  },
  "Mac OS Lion" => {
    "Firefox" => ["16", "15"],
    "Safari" => ["5", "4"]
  }
}

versions_in_browsers.each do |os, values|
  #puts " - key : #{os}, values : #{values}"
  values.each do |browser, versions|
    #puts "-- key #{browser}, val : #{versions}"
    versions.each do |version|
      #puts "--- Os :#{os} => Browser : #{browser} => Version : #{version}"
      OsVersion.create(version_id: Version.find_by_name(version).id, os_id: Os.find_by_name(os).id  )  
    end
  end    
end

