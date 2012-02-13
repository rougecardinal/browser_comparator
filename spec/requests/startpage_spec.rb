require 'spec_helper'

describe 'StartPage' do

  before(:each) do
    @session = Capybara::Session.new(:selenium)
    Capybara.app_host = "http://browser_comparator.dev"
  end

  it 'is visiting by user' do
    @session.visit '/'
    @session.has_link?('See more').should be_true
  end
end