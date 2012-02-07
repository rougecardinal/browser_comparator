Factory.define :browser_family do |f|
  f.name "name"
	f.prod_society "prod_society"
	f.rating 5
end

Factory.define :version do |f|
  f.sequence(:name) {|n| "#{n}"}
  f.date_release "2004-04-04"
  f.association :browser_family
end

Factory.define :category do |f|
  f.name "category"
end

Factory.define :feature do |f|
  f.name "feature"
  f.association :category
end

Factory.define :featureVersion do |f|
  f.association :feature
  f.association :version 
end

  # let(:add_version) {
  #   version = subject.versions.new()
  #   version.id = 1
  #   version.name = 0
  #   version.date_release = "2004- 04-04"
  #   version.browser_family_id = 1
  #   version.created_at = "2012-01-17 14:48:32"
  #   version.updated_at = "2012-01-17 14:48:32"
  # }
  
  # let(:add_features_version) {
  #   browser = BrowserFamily.find_by_id(1)
  #   version = browser.versions.find_by_id(1)
    
  #   feature1 = version.features.new()
  #   feature1.id = 1
  #   feature1.name = "premiere feature" 
  #   feature1.category_id = 1
  #   feature1.created_at = "2011-01-17 14:48:35"
  #   feature1.updated_at = "2011-01-17 18:48:35"
  #   feature1.save
    
  #   feature2 = version.features.new()
  #   feature2.id = 2
  #   feature2.name = "deuxieme feature" 
  #   feature2.category_id = 1
  #   feature2.created_at = "2012-01-17 14:48:35"
  #   feature2.updated_at = "2012-01-17 20:48:35"
  #   feature2.save
    
  #   feature3 = version.features.new()
  #   feature3.id = 3
  #   feature3.name = "troisieme feature" 
  #   feature3.category_id = 2
  #   feature3.created_at = "2012-01-17 14:48:35"
  #   feature3.updated_at = "2012-01-17 20:48:35"
  #   feature3.save  

  #   feature4 = version.features.new()
  #   feature4.id = 4
  #   feature4.name = "quatrieme feature" 
  #   feature4.category_id = 2
  #   feature4.created_at = "2012-01-17 14:48:35"
  #   feature4.updated_at = "2012-01-17 20:48:35"
  #   feature4.save
  # }