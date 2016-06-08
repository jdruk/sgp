require 'rails_helper'

describe Ability do
	before(:each) do
		@ability = Ability.new(:name => 'Designer', :description => 'Criaçao de projetos graficos', :scope => 5)
	end

	it 'should be not created without name' do
		@ability.name = nil
		expect(@ability).not_to be_valid
	end

	it 'should be not created without description' do
		@ability.description = nil
		expect(@ability).not_to be_valid
	end

	it 'should be not created without scope' do
		@ability.scope = nil
		expect(@ability).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@ability).to be_valid
	end
end