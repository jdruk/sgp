require 'rails_helper'


describe Release do
	before(:each) do
		@release = Release.new(:version => '2.0', :deliver_date => '02/06/2016', :project_id => 2)
	end

	it 'should be not created without version' do
		@release.version = nil
		expect(@release).not_to be_valid
	end

	it 'should be not created without deliver_date' do
		@release.deliver_date = nil
		expect(@release).not_to be_valid
	end

	it 'should be not created without scope' do
		@release.project_id = nil
		expect(@release).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@release).to be_valid
	end
end