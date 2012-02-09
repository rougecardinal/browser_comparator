require 'spec_helper'

describe 'browser_comparator_controller' do
  it "infers the controller path" do
    controller.request.path_parameters["controller"].should eq("browser_comparator")
  end
  it "infers the controller path" do
    controller.request.path_parameters["action"].should eq("startpage")
  end
end











