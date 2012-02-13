require 'spec_helper'

describe 'browser_comparator/startpage.html.haml' do
  
  let(:browser) { Factory.create(:browser_family) }
  let(:version) { Factory.create(:version, :browser_family => browser) }
  
	it "Page should have selector '#browser'" do
		render
		rendered.should have_selector(".browsers_name")
	end

  it "test selector" do
    render 
    rendered.should have_selector("li", :count => 5)
  end

  it 'test link' do
    render
    rendered.should have_content(:a)
  end
  
  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("browser_comparator")
  end
  
  it "infers the controller path" do
    controller.request.path_parameters["action"].should eq("startpage")
  end
  
end
