require 'rails_helper'

describe UserAbility do
	before(:each) do
		@user_ability = UserAbility.new(:points => 4, :user_id => 1, :ability_id => 1)
	end

	it 'should be not created without points' do
		@user_ability.points = nil
		expect(@user_ability).not_to be_valid
	end

	it 'should be not created without user_id' do
		@user_ability.user_id = nil
		expect(@user_ability).not_to be_valid
	end
	it 'should be not created without ability_id' do
		@user_ability.ability_id = nil
		expect(@user_ability).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@user_ability).to be_valid
	end
end