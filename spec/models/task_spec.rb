require 'rails_helper'

describe Task do
	before(:each) do
		@task = Task.new(:description => 'Criar campos de consumo diário para realizar a média de consumo mensal da boate', :start_date => '02/08/2016', :end_date => '02/09/2016', :status => 'pendent', :user_story_id => 1)
	end

	it 'should be not created without description' do
		@task.description = nil
		expect(@task).not_to be_valid
	end

	it 'should be not created without start_date' do
		@task.start_date = nil
		expect(@task).not_to be_valid
	end

	it 'should be not created without end_date' do
		@task.end_date = nil
		expect(@task).not_to be_valid
	end

	it 'should be not created without status' do
		@task.status = nil
		expect(@task).not_to be_valid
	end

	it 'should be not created without user_story_id' do
		@task.user_story_id = nil
		expect(@task).not_to be_valid
	end

	it 'should be created with all requirements' do
		expect(@task).to be_valid
	end
end