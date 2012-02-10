require 'spec_helper'

describe 'BrowserFamily' do  

  let(:browser) { Factory.create(:browser_family) }
  let(:version) { Factory.create(:version, :browser_family => browser) }
  let(:category) { Factory.create(:category) }
  let(:feature) { Factory.create(:feature, :category => category)}
  let(:featureVersion) { Factory.create(:featureVersion, :feature => feature, :version => version) }
 
  it " Create Factory / browser" do
    browser.name.should == "Firefox"
  end

  it "Create Factory / version" do
    version.date_release.should == "2004-04-04".to_date
  end

  it " Verify browser version" do
    version 
    browser.versions.first.should == version
  end

  it "Verify featureVersion" do
    feature
    version
    featureVersion.feature_id.should == feature.id
  end
end

  # context '#verify attributes' do
  #   it '=> with attributes' do
  #     subject.name.should_not == nil
  #     subject.prod_society.should_not == nil
  #   end
    
  #   it '=> kind of attributes' do
  #     subject.name.should be_a_kind_of(String)
  #     subject.prod_society.should be_a_kind_of(String)
  #     if subject.rating != nil 
  #       subject.rating.should be_a_kind_of(Integer)
  #     end
  #   end
  #   it '=> Versions should == 0' do
  #     subject.versions.count.should == 0
  #   end
  #   it '=> Versions should == 1' do
  #     add_version
  #     subject.versions.count.should == 1
  #   end
  # end
