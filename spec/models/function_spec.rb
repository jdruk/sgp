require 'rails_helper'

describe Function do
	before(:each) do
		@function = Function.new(:name => 'Planejar requisitos', :description => 'buscar todos os requisitos necessários para a produção do projeto')
	end

	it 'should be not created without name' do
		@function.name = nil
		expect(@function).not_to be_valid
	end

	it 'should be not created without description' do
		@function.description = nil
		expect(@function).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@function).to be_valid
	end
end