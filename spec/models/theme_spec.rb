require 'rails_helper'

describe Theme do
	before(:each) do
		@theme = Theme.new(:project_id => 2, :name => 'Anos 80', :description => 'Esse tema fará da boate em um dia permitir que seus convidados se vistam de acordo com que foi sugerido')
	end

	it 'should be not created without name' do
		@theme.name = nil
		expect(@theme).not_to be_valid
	end

	it 'should be not created without description' do
		@theme.description = nil
		expect(@theme).to be_valid
	end

	it 'should be not created without project_id' do
		@theme.project_id = nil
		expect(@theme).not_to be_valid
	end


	it 'should be created with all requirements' do
		expect(@theme).to be_valid
	end
end