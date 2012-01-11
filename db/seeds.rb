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

# Parcours du tableau et creation du browser s'il n'existe pas
browser_families_attributes.each do |attributes|
  BrowserFamily.find_or_create_by_name(attributes)
end

#VERSIONS.
##########

#Tableau de hashs.
browsers_versions = {
"Safari" => [{name: "1", date_release: "2003/10/24"},
             {name: "2", date_release: "2006/01/10"},
             {name: "3", date_release: "2008/11/13"},
             {name: "4", date_release: "2009/11/11"},
             {name: "5", date_release: "2010/06/20"}],
"Firefox" => [{name: "0", date_release: "2004/02/09"},
              {name: "1", date_release: "2004/11/09"},
              {name: "2", date_release: "2006/10/24"},
              {name: "3", date_release: "2008/06/17"},
              {name: "4", date_release: "2011/03/22"},
              {name: "5", date_release: "2011/06/21"},
              {name: "6", date_release: "2011/08/16"},
              {name: "7", date_release: "2011/09/27"},
              {name: "8", date_release: "2011/11/08"},
              {name: "9", date_release: "2011/12/20"}],
"Google Chrome" => [{name: "0", date_release: "2008/09/02"},
                    {name: "1", date_release: "2008/12/11"},
                    {name: "2", date_release: "2009/05/24"},
                    {name: "3", date_release: "2009/10/12"},
                    {name: "4", date_release: "2010/01/25"},
                    {name: "5", date_release: "2010/05/21"},
                    {name: "6", date_release: "2010/09/02"},
                    {name: "7", date_release: "2010/10/21"},
                    {name: "8", date_release: "2010/12/02"},
                    {name: "9", date_release: "2011/02/03"},
                    {name: "10", date_release: "2011/03/08"},
                    {name: "11", date_release: "2011/04/27"},
                    {name: "12", date_release: "2011/06/07"},
                    {name: "13", date_release: "2011/08/02  "},                      
                    {name: "14", date_release: "2011/09/16"},
                    {name: "15", date_release: "2011/10/25"},
                    {name: "16", date_release: "2011/12/13"}],
"Internet Explorer" => [{name: "1", date_release: "1995/08/16"},
                        {name: "2", date_release: "1995/11/22"},
                        {name: "3", date_release: "1996/08/13"},
                        {name: "4", date_release: "1997/09/01"},
                        {name: "5", date_release: "1999/03/18"},
                        {name: "6", date_release: "2001/08/27"},
                        {name: "7", date_release: "2006/10/18"},
                        {name: "8", date_release: "2009/03/19"},
                        {name: "9", date_release: "2011/03/14"}],
"Opera" => [{name: "1", date_release: "1995/04/12"},
            {name: "2", date_release: "1996/04/22"},
            {name: "3", date_release: "1997/12/01"},
            {name: "4", date_release: "2000/06/28"},
            {name: "5", date_release: "2000/12/06"},
            {name: "6", date_release: "2001/12/18"},
            {name: "7", date_release: "2003/01/28"},
            {name: "8", date_release: "2005/04/19"},
            {name: "9", date_release: "2006/06/20"},
            {name: "10", date_release: "2009/09/01"},
            {name: "11", date_release: "2010/12/16"}]
}

#Parcours du hash avec les deux attributs Browser_name et Versions_attributes.
#Recherche du browser par son nom.
browsers_versions.each do |browser_name, versions_attributes|
  browser = BrowserFamily.find_by_name(browser_name)
  versions_attributes.each do |version_attributes|
    version_attributes.merge!(browser_family_id: browser.id) #Merge! => Ajout du hash passe en parametre au hash precedent.
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

versions_in_browsers = {"Windows 7" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..9)},
                        "Windows Vista" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..9)},
                        "Windows XP" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..8), "Opera" => (1..9)},
                        "Mac OS Lion" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..9)},
                        "Mac OS Snow Leopard" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..9)},
                        "Mac OS Leopard" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..9)},
                        "Linux Ubuntu" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..9)},
                        "Linux Autres" => {"Google Chrome" => (1..16), "Safari" => (1..9), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..9)}
                       }
versions_in_browsers.each do |os, values|
  values.each do |browser, versions|
    versions.each_with_index do |version_number, index|
     os_version = OsVersion.create(version_id: Version.find_by_name(version_number).id, os_id: Os.find_by_name(os).id)  
    end
  end
end


# FEATURE.
#########

features = {
  "Aide/Support" => ["Support e-Mail", "Aide en ligne", "Tutoriels", "FAQs", "Docs/Guides", "Support Telephonique"],
  "Securite" => ["Controle parental", "Anti-Spyware", "Blocage Pop-up", "Anti-Virus", "Navigation en mode Prive", "Historique de navigation"], 
  "Divers" => ["Geolocalisation", "Barre URL intelligente", "Mise à jour automatique", "Integration d'un moteur de recherche", "Sauvegarde d'onglets", 
               "Modification du theme", "Flux RSS", "Gestionnaire de Mot de passe", "Zoom sur la page", "Add-on", "Developpement Open Source", 
               "Gestionnaire de telechargements", "Syncronisation mobile", "Interaction vocale"]
} 

features.each do |category_name, features_name|
  category = Category.find_or_create_by_name(name: category_name)
  features_name.each do |feature_name|
    Feature.find_or_create_by_name(name: feature_name, category_id: category.id)
  end
end

#FEATURE VERSION.
################

features_in_versions = {
  "Support e-Mail" => {
    "Google Chrome" => 1,
    "Safari" => 1,
    "Firefox" => 4,
    "Internet Explorer" => 4,
    "Opera" => 11
  },
  "Aide en ligne" => {
    "Google Chrome" => 1,
    "Safari" => 3,
    "Firefox" => 3,
    "Internet Explorer" => 5,
    "Opera" => 2
  }
  # ,
  # "Tutoriels" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "FAQs" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Docs/Guides" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Support Telephonique" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Controle parental" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Anti-Spyware" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Blocage Pop-up" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Anti-Virus" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Navigation en mode Prive" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Historique de navigation" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Geolocalisation" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Barre URL intelligente" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Mise à jour automatique" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Integration d'un moteur de recherche" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Sauvegarde d'onglets" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Modification du theme" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Flux RSS" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Gestionnaire de Mot de passe" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Zoom sur la page" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Add-on" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Developpement Open Source" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Gestionnaire de telechargements" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Syncronisation mobile" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
  # "Interaction vocale" => {"Google Chrome" => (1..16), "Safari" => (1..5), "Firefox" => (1..9), "Internet Explorer" => (1..9), "Opera" => (1..11)}
}

features_in_versions.each do |feature_name, browsers|
  feature = Feature.find_by_name(feature_name)
  browsers.each do |browser_name, min_version_number|
    browser = BrowserFamily.find_by_name(browser_name)
    versions = browser.versions.where(["name > ?", min_version_number])
    versions.each do |version|
      
      if !version.features.include? feature
        version.features << feature 
        version.save
      end
      
    end
  end
end

puts "#{FeatureVersion.count}"