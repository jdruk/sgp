require 'rails_helper'

describe UserStory do
	before(:each) do
		@user_story = UserStory.new(:description => 'Essa é responsável pelos comandos do usuário..', :business_value => 2, :story_points => 3, :status => 'pendent', :theme_id => 1, :sprint_id => 2)

	end

	it 'should be not created without description' do
		@user_story.description = nil
		expect(@user_story).not_to be_valid
	end

	it 'should be not created without business_value' do
		@user_story.business_value = nil
		expect(@user_story).not_to be_valid
	end

	it 'should be not created without story_points' do
		@user_story.story_points = nil
		expect(@user_story).not_to be_valid
	end

	it 'should be not created without status' do
		@user_story.status = nil
		expect(@user_story).not_to be_valid
	end

	it 'should be not created without theme_id' do
		@user_story.theme = nil
		expect(@user_story).not_to be_valid
	end

	it 'should be not created without sprint_id' do
		@user_story.sprint = nil
		expect(@user_story).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@user_story).to be_valid
	end
end