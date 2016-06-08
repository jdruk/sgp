require 'rails_helper'

describe UserLanguage do
	before(:each) do
		@user_language = UserLanguage.new(:proficiency => 4, :user_id => 2, :language_id => 1)
	end

	it 'should be not created without proficiency' do
		@user_language.proficiency = nil
		expect(@user_language).to be_valid
	end

	it 'should be not created without user_id' do
		@user_language.user_id= nil
		expect(@user_language).to be_valid
	end
	it 'should be not created without language_id' do
		@user_language.user_id = nil
		expect(@user_language).to be_valid
	end

	it 'should be created with all requirements' do
		expect(@user_language).to be_valid
	end
end