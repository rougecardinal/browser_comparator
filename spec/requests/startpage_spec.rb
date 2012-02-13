require 'spec_helper'
 
describe 'StartPage' do
  
  before(:each) do
    @session = Capybara::Session.new(:selenium)
  end
  
  it 'is visiting by user' do
    @session.visit 'http://browser_comparator.dev/'
    @session.has_link?('See more').should be_true
  end
end