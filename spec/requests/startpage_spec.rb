require 'spec_helper'
 
describe 'StartPage' do
  it 'is visiting by user' do
    
    # request.env['HTTP_USER_AGENT'] = "Chrome"
    # request.stub!(:request).and_return('Chrome')
    # request.env['HTTP_USER_AGENT'].nil?
    # page.should have_content('Chrome')
    # request.should_not be_nil

    session = Capybara::Session.new(:selenium)
    session.visit 'http://browser_comparator.dev/'
    
  end
end