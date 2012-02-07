require 'spec_helper'

describe 'BrowserFamily' do

  it " Create Factory / browser" do
    browser = Factory.create(:browser_family)
    browser.name.should == "Chrome"  
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
