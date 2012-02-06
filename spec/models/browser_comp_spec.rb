require 'spec_helper'

describe 'BrowserFamily' do
  subject { BrowserFamily.new }

  before(:all) do
    subject.id = 1
    subject.name = "Chrome"
    subject.prod_society = "Google"
    subject.rating = nil
  end

  let(:add_version) {
    version = subject.versions.new()
    version.id = 1
    version.name = 0
    version.date_release = "2004- 04-04"
    version.browser_family_id = 1
    version.created_at = "2012-01-17 14:48:32"
    version.updated_at = "2012-01-17 14:48:32"
    version.save
  }
  let(:add_features_version) {
    browser = BrowserFamily.find_by_id(1)
    version = browser.versions.find_by_id(1)
    
    feature1 = version.features.new()
    feature1.id = 1
    feature1.name = "premiere feature" 
    feature1.category_id = 1
    feature1.created_at = "2011-01-17 14:48:35"
    feature1.updated_at = "2011-01-17 18:48:35"
    feature1.save
    
    feature2 = version.features.new()
    feature2.id = 2
    feature2.name = "deuxieme feature" 
    feature2.category_id = 1
    feature2.created_at = "2012-01-17 14:48:35"
    feature2.updated_at = "2012-01-17 20:48:35"
    feature2.save
    
    feature3 = version.features.new()
    feature3.id = 3
    feature3.name = "troisieme feature" 
    feature3.category_id = 2
    feature3.created_at = "2012-01-17 14:48:35"
    feature3.updated_at = "2012-01-17 20:48:35"
    feature3.save  

    feature4 = version.features.new()
    feature4.id = 4
    feature4.name = "quatrieme feature" 
    feature4.category_id = 2
    feature4.created_at = "2012-01-17 14:48:35"
    feature4.updated_at = "2012-01-17 20:48:35"
    feature4.save
  }

  context '#verify attributes' do
    it '=> with attributes' do
      subject.name.should_not == nil
      subject.prod_society.should_not == nil
    end
    
    it '=> kind of attributes' do
      subject.name.should be_a_kind_of(String)
      subject.prod_society.should be_a_kind_of(String)
      if subject.rating != nil 
        subject.rating.should be_a_kind_of(Integer)
      end
    end
    it '=> Versions should == 0' do
      subject.versions.count.should == 0
    end
    it '=> Versions should == 1' do
      add_version
      subject.versions.count.should == 1
    end
    it 'last_version_has_feature?(feature)' do
      add_version
      add_features_version
      feature = Feature.find_by_name("premiere feature")
      feature.name.should == "premiere feature"
      feature.persisted?.should be_true
      subject.last_version_has_feature?(feature)
    end
  end
end