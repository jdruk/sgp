require 'rails_helper'



describe Language do
	before(:each) do
		@language = Language.new(:name => 'Portugues', :description => 'Lingua natural do Brasil, portugues brasileiro')
	end

	it 'should be not created without name' do
		@language.name = nil
		expect(@language).not_to be_valid
	end

	it 'should be not created without description' do
		@language.description = nil
		expect(@language).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@language).to be_valid
	end
end