require 'rails_helper'

describe Project do
	before(:each) do
		@project = Project.new(:name => 'Sistema de Controle de Boate', :size => 5, :start_date => '02/08/2016', :end_date => '02/01/2017', :local_id => 1)
	end

	it 'should be not created without name' do
		@project.name = nil
		expect(@project).not_to be_valid
	end

	it 'should be not created without size' do
		@project.size = nil
		expect(@project).to be_valid
	end

	it 'should be not created without start_date' do
		@project.start_date = nil
		expect(@project).to be_valid
	end

	it 'should be not created without end_date' do
		@project.end_date = nil
		expect(@project).to be_valid
	end

	it 'should be not created without local_id' do
		@project.local_id = nil
		expect(@project).not_to be_valid
	end 

	it 'should be created with all requirements' do
		expect(@project).to be_valid
	end
end