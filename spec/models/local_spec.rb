require 'rails_helper'


describe Local do
	before(:each) do
		@local = Local.new(:name => 'Picos', :country => 'Brasil', :state => 'Piaui', :city => 'Picos', :zip_code => '64607-760')
	end

	it 'should be not created without name' do
		@local.name = nil
		expect(@local).not_to be_valid
	end

	it 'should be not created without country' do
		@local.country = nil
		expect(@local).not_to be_valid
	end

	it 'should be not created without state' do
		@local.state = nil
		expect(@local).not_to be_valid
	end

	it 'should be not created without city' do
		@local.city = nil
		expect(@local).not_to be_valid
	end

	it 'should be not created without zip_code' do
		@local.zip_code = nil
		expect(@local).not_to be_valid
	end	

	it 'should be created with all requirements' do
		expect(@local).to be_valid
	end
end


