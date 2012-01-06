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
  "Safari" => [{name: "v5", date_opening: "2009/11/29", description: "Dernière version Mac OS X"}, {name: "v4", date_opening: "2011/10/12", description: "Avant dernière version Mac OS X"}],
  "Firefox" => [{name: "v9", date_opening: "2011/12/11", description: "Dernière version Firefox"}, {name: "v8", date_opening: "2011/11/08", description: "Avant dernière version Firefox"}],
  "Google Chrome" => [{name: "v16", date_opening: "2011/12/13", description: "Dernière version Google Chrome."}, {name: "v15", date_opening: "2011/10/27", description: "Avant dernière version Google Chrome."}],
  "Internet Explorer" => [{name: "v9", date_opening: "2011/12/22", description: "Dernière version Internet Explorer."}, {name: "v8", date_opening: "2009/03/19", description: "Avant dernière version Internet Explorer."}],
  "Opera" => [{name: "v11", date_opening: "2011/12/06", description: "Dernière version Opera."}, {name: "v10", date_opening: "2011/06/28", description: "Avant dernière version Opera."}]
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

chrome = BrowserFamily.find_by_name("Google Chrome")
safari = BrowserFamily.find_by_name("Safari")
linux = Os.find_by_name("Linux Ubuntu")

versions_in_browsers = {"Google Chrome" => "v16", "Safari" => "v5"}
# version_chrome = versions_in_browsers["Google Chrome"]
# version_safari = versions_in_browsers["Safari"]

versions_in_browsers.each do |key, value|
  puts "key : #{key}, value #{value}" #Ca fonctionne aussi comme ca
end

#chrome_releases = ["v15", "v16"]

# chrome_releases.each do |version|
#   chrome_version = chrome.versions.find_by_name(version)
#   chrome_version.os_versions.create(os: linux)
#  # puts "ma version est : #{chrome_version.name}"
# end

#chrome_v16 = chrome.versions.find_by_name("v16")
#chrome_v15 = chrome.versions.find_by_name("v15")

#chrome_v15.os_versions.create(os: linux)
#chrome_v16.os_versions.create(os: linux)

puts "mon navigateur est : #{chrome.name}"
puts "mon os est : #{linux.name}"
puts "ma version de chrome est : #{version_chrome}"
puts "ma version de safari est : #{version_safari}"
# puts "ma version 1  est : #{chrome_v15.name}"
# puts "ma version 2  est : #{chrome_v16.name}"

# puts "dernier os ajouté à chrome_v15 #{chrome_v15.os_versions.last.os.name}"
# puts "dernier os ajouté à chrome_v16 #{chrome_v16.os_versions.last.os.name}"

# [{"Safari" => v5}, {"Safari" => v4}, {"Firefox" => v9}, {"Firefox" => v8}, {"Google Chrome" => v16}, {"Google Chrome" => v15}, {"Internet Explorer" => v9}, {"Internet Explorer" => v8}, {"Opera" => v11}, {"Opera" => v10}]

# os_versions = {
#   "Windows 7" => [{"Safari" => v5}, {"Safari" => v4}, {"Firefox" => v9}, {"Firefox" => v8}, {"Google Chrome" => v16}, {"Google Chrome" => v15}, {"Internet Explorer" => v9}, {"Internet Explorer" => v8}, {"Opera" => v11}, {"Opera" => v10}],
# }
# 
# browsers_versions.each do |browser_name, versions_attributes|
#   browser = BrowserFamily.find_by_name(browser_name)
#   versions_attributes.each do |version_attributes|
#     version_attributes.merge!(browser_family_id: browser.id)
#     Version.find_or_create_by_name_and_browser_family_id(version_attributes)
#   end
# end