# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_feature_in_version(browser, feature, min_version_number)
  versions = browser.versions.where(["name >= ?", min_version_number])
  versions.each do |version|
    if !version.features.include? feature
      version.features << feature
      version.save
    end
  end
end

# BROWSERS.
###########

# Tableau de hashs avec les attributs de BrowserFamily
browser_families_attributes = [
  {name: "Firefox", prod_society: "Mozilla", description: "Les nombreuses extensions qu'il propose font de lui un navigateur puissant et complet.", link: "http://www.mozilla.org/firefox"},
  {name: "Chrome", prod_society: "Google", description: "Interface épurée, très rapide avec toute les fonctionnalitées que Google propose.", link: "http://www.google.com/chrome"},
  {name: "Internet Explorer", prod_society: "Microsoft", description: "Navigateur complet, simple et qui ne cesse d'évoluer.", link: "http://www.microsoft.com/ie"},
  {name: "Safari", prod_society: "Apple", description: "Safari, à l'image d'Apple, est innovant, complet et rapide.", link: "http://www.apple.com/safari/"},
  {name: "Opera", prod_society: "Opera Software", description: "Rapidité, sécurité et accessibilité sont les maîtres mots pour définir ce navigateur", link: "http://www.opera.com/"}
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
              {name: "9", date_release: "2011/12/20"},
              {name: "10", date_release: "2012/02/10"}],
"Chrome" => [{name: "0", date_release: "2008/09/02"},
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
                    {name: "13", date_release: "2011/08/02"},
                    {name: "14", date_release: "2011/09/16"},
                    {name: "15", date_release: "2011/10/25"},
                    {name: "16", date_release: "2011/12/13"},
                    {name: "17", date_release: "2012/02/09"}],
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

versions_in_browsers = {"Windows 7" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
                        "Windows Vista" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
                        "Windows XP" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..8), "Opera" => (1..11)},
                        "Mac OS Lion" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
                        "Mac OS Snow Leopard" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
                        "Mac OS Leopard" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
                        "Linux Ubuntu" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..9), "Opera" => (1..11)},
                        "Linux Autres" => {"Chrome" => (0..17), "Safari" => (1..5), "Firefox" => (0..9), "Internet Explorer" => (1..9), "Opera" => (1..11)}
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
  "Divers" => ["Barre URL intelligente", "Mise à jour automatique", "Integration d'un moteur de recherche", "Sauvegarde d'onglets",
               "Modification du theme", "Flux RSS", "Gestionnaire de Mot de passe", "Zoom sur la page", "Add-on", "Developpement Open Source",
               "Gestionnaire de telechargements", "Syncronisation mobile", "Interaction vocale"]
}

features.each do |category_name, features_name|
  category = Category.find_or_create_by_name(name: category_name)
  features_name.each do |feature_name|
    Feature.find_or_create_by_name(name: feature_name, category_id: category.id)
  end
end
#Feature.find_by_name("Support e-Mail").versions.count

#FEATURE VERSION.
################

features_in_versions = {
  "Support e-Mail" => {
    "Chrome" => false,
    "Safari" => false
  },
    "Aide en ligne" => {
    },
    "Tutoriels" => {
    },
    "FAQs" => {
    },
    "Docs/Guides" => {
    },
    "Support Telephonique" => {
      "Chrome" => false,
      "Safari" => false,
      "Firefox" => false,
      "Opera" => false
    },
    "Controle parental" => {
      "Chrome" => false,
      "Safari" => false,
      "Opera" => false
    },
    "Anti-Spyware" => {
    },
    "Blocage Pop-up" => {
    },
    "Anti-Virus" => {
    },
    "Navigation en mode Prive" => {
    },
    "Historique de navigation" => {
    },
    "Barre URL intelligente" => {
    },
    "Mise à jour automatique" => {
      "Safari" => false,
      "Firefox" => false,
      "Internet Explorer" => false,
      "Opera" => false
    },
    "Integration d'un moteur de recherche" => {
    },
    "Sauvegarde d'onglets" => {
    },
    "Modification du theme" => {
    },
    "Flux RSS" => {
    },
    "Gestionnaire de Mot de passe" => {
    },
    "Zoom sur la page" => {
    },
    "Add-on" => {
    },
    "Developpement Open Source" => {
      "Safari" => false,
      "Internet Explorer" => false,
      "Opera" => false
    },
    "Gestionnaire de telechargements" => {
    },
    "Syncronisation mobile" => {
      "Safari" => false,
      "Firefox" => false
    },
    "Interaction vocale" => {
      "Chrome" => false,
      "Safari" => false,
      "Firefox" => false,
      "Internet Explorer" => false
    }
}

min_versions_hash = {"Chrome" => 0, "Internet Explorer" => 1, "Opera" => 1, "Safari" => 1, "Firefox" =>0}

features_in_versions.each do |feature_name, browsers|
  merging_version_browser = min_versions_hash.merge browsers
  merging_version_browser.delete_if{|key, value| value == false}

  feature = Feature.find_by_name(feature_name)
  merging_version_browser.each do |browser_name, min_version_number|

    browser = BrowserFamily.find_by_name(browser_name)
    create_feature_in_version(browser, feature, min_version_number)
  end
end
