require 'rails_helper'

describe TaskRequirement do
	before(:each) do
		@task_requirement = TaskRequirement.new(:level => 4, :task_id => 2, :ability_id => 1)
	end

	it 'should be not created without level' do
		@task_requirement.level = nil
		expect(@task_requirement).not_to be_valid
	end

	it 'should be not created without task_id' do
		@task_requirement.task_id = nil
		expect(@task_requirement).not_to be_valid
	end
	it 'should be not created without ability_id' do
		@task_requirement.ability_id = nil
		expect(@task_requirement).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@task_requirement).to be_valid
	end
end