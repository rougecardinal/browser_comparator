require 'spec_helper'

describe 'Index view' do
	it 'should be' do
		get root_path
		response.status.should be(200)
	end
end