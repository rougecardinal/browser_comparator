require 'spec_helper'

describe 'Index' do
  nb_browser = BrowserFamily.count
  nb_feature = Feature.count
  nb_category = Category.count
  
  
  before(:each) do
    @session = Capybara::Session.new(:selenium)
    Capybara.app_host = 'http://browser_comparator.dev'
    @session.visit "/index"
  end

  it 'current_browser is Firefox' do
    @session.should have_selector('.current_browser', :text => "Firefox")
  end

  it 'other browsers' do
    @session.should have_selector('.other_browser', :text => "Firefox")
    @session.should have_selector('.other_browser', :text => "Opera")
    @session.should have_selector('.other_browser', :text => "Safari")
    @session.should have_selector('.other_browser', :text => "Chrome")
    @session.should have_selector('.other_browser', :text => "Internet Explorer")

    @session.should have_css('th.other_browser', :count => nb_browser)
  end
  
  it 'has 25 features' do
    @session.should have_css('th.feature_name', :count => nb_feature + 2)
  end
  
  it 'has 3 category' do
    @session.should have_css('th.category_name', :count => nb_category)
  end
end