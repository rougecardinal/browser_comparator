require 'spec_helper'

describe 'browser_comparator/startpage.html.haml' do
  it "Page include string 'hahaha'" do
  	render :template => "browser_comparator/startpage.html.haml"
  	rendered.should have_content("hahaha")
	end
	it " Page should have selector '#test'" do
		render
		rendered.should have_selector("#test")
	end
  it "test selector" do
    render 
    rendered.should have_selector("td", :count => 4)
  end
  it 'test link' do
    render
    rendered.should have_content(:a)
  end
end