# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# BROWSERS.
###########

# Tableau de hashs avec les attributs de BrowserFamily
browser_families_attributes = [
  {name: "Firefox", prod_society: "Mozilla"},
  {name: "Google Chrome", prod_society: "Google"},
  {name: "Internet Explorer", prod_society: "Microsoft"},
  {name: "Safari", prod_society: "Apple"},
  {name: "Opera", prod_society: "Opera Software"}
]

# Parcours du tableau et création du browser s'il n'existe pas
browser_families_attributes.each do |attributes|
  BrowserFamily.find_or_create_by_name(attributes)
end

#VERSIONS.
##########

#Tableau de hashs.
browsers_versions = {
  "Safari" => [{name: "5", date_opening: "2009/11/29", description: "Dernière version Mac OS X"}, {name: "4", date_opening: "2011/10/12", description: "Avant dernière version Mac OS X"}],
  "Firefox" => [{name: "9", date_opening: "2011/12/11", description: "Dernière version Firefox"}, {name: "8", date_opening: "2011/11/08", description: "Avant dernière version Firefox"}],
  "Google Chrome" => [{name: "16", date_opening: "2011/12/13", description: "Dernière version Google Chrome."}, {name: "15", date_opening: "2011/10/27", description: "Avant dernière version Google Chrome."}],
  "Internet Explorer" => [{name: "9", date_opening: "2011/12/22", description: "Dernière version Internet Explorer."}, {name: "8", date_opening: "2009/03/19", description: "Avant dernière version Internet Explorer."}],
  "Opera" => [{name: "11", date_opening: "2011/12/06", description: "Dernière version Opera."}, {name: "10", date_opening: "2011/06/28", description: "Avant dernière version Opera."}]
}

#Parcours du hash avec les deux attributs Browser_name et Versions_attributes.
#Recherche du browser par son nom.
browsers_versions.each do |browser_name, versions_attributes|
  browser = BrowserFamily.find_by_name(browser_name)
  versions_attributes.each do |version_attributes|
    version_attributes.merge!(browser_family_id: browser.id) #Merge! => Ajout du hash passé en paramètre au hash précédent.
    Version.find_or_create_by_name_and_browser_family_id(version_attributes)
  end
end

#OS.
###

os_names = [ 
  "Windows 7", "Windows Vista", "Windows XP",
  "Mac OS Lion", "Mac OS Snow Leopard", "Mac OS Leopard",
  "Linux Ubuntu", "Linux Autres"]    
os_names.each do |attribute|
  Os.find_or_create_by_name(attribute)
end

#OS VERSION.
###########

versions_in_browsers = {"Windows 7" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8,9], "Opera" => [8,9]},
                       "Windows Vista" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8,9], "Opera" => [8,9]},
                       "Windows XP" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8], "Opera" => [8,9]},
                       "Mac OS Lion" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8,9], "Opera" => [8,9]},
                       "Mac OS Snow Leopard" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8,9], "Opera" => [8,9]},
                       "Mac OS Leopard" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8,9], "Opera" => [8,9]},
                       "Linux Ubuntu" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8,9], "Opera" => [8,9]},
                       "Linux Autres" => {"Google Chrome" => [15,16], "Safari" => [4,5], "Firefox" => [8,9], "Internet Explorer" => [8,9], "Opera" => [8,9]}}
versions_in_browsers.each do |os, values|
  values.each do |browser, versions|
    versions[0..1].each_with_index do |version_number, index|
       os_version = OsVersion.create(version_id: Version.find_by_name(version_number).id, os_id: Os.find_by_name(os).id)  
        puts "#{index} ...........  #{version_number}......... #{os_version}"
    end
  end
end


# FEATURE.
#########

features = {
  "Aide/Support" => ["Support e-Mail", "Aide en ligne", "Tutoriels", "FAQs", "Docs/Guide", "Support Téléphonique"],
  "Securite" => ["Controle parental", "Anti-Spyware", "Blocage Pop-up", "Anti-Virus", "Navigation en mode Privé", "Historique de navigation"], 
  "Divers" => ["Géolocalisation", "Barre URL intelligente", "Mise à jour automatique", "Integration d'un moteur de recherche", "Sauvegarde d'onglets", 
               "Modification du thème", "Flux RSS", "Gestionnaire de Mot de passe", "Zoom sur la page", "Add-on", "Développement Open Source", 
               "Gestionnaire de téléchargements", "Syncronisation mobile", "Interaction vocale"]
} 

features.each do |category_name, features_name|
  category = Category.find_or_create_by_name(name: category_name)
  features_name.each do |feature_name|
    Feature.find_or_create_by_name(name: feature_name, category_id: category.id)
  end
end

#FEATURE VERSION.
################

