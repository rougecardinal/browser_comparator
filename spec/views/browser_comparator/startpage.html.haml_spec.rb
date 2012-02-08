require 'spec_helper'

describe 'browser_comparator/startpage.html.haml' do
  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("browser_comparator")
  end
  it "infers the controller path" do
    controller.request.path_parameters["action"].should eq("startpage")
  end
  it "Page include string 'hahaha'" do
  	render :template => "browser_comparator/startpage.html.haml"
  	rendered.should include("hahaha")
	end
	it " Page should have selector '#test'" do
		render
		rendered.should have_selector("#test")
	end
	
end