require 'spec_helper'

describe 'Index' do

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

    @session.should have_css('th.other_browser', :count => 5)
  end
end