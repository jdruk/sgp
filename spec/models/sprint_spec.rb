require 'rails_helper'


describe Sprint do
	before(:each) do
		@sprint = Sprint.new(:name => 'Primeira Sprint', :start_date=> '01/01/2016', :end_date => '01/10/2016', :planning_start_date => '01/02/2016', :planning_end_date => '01/09/2016', :execution_start_date => '03/02/2016', :execution_end_date => '03/09/2016', :review_meeting_date => '05/04/2016', :retrospective_meeting_date => '07/06/2016', :project_id => 1, :release_id => 1)
	end


	it 'should be not created without name' do
		@sprint.name = nil
		expect(@sprint).not_to be_valid
	end

	it 'should be not created without start_date' do
		@sprint.start_date = nil
		expect(@sprint).not_to be_valid
	end

	it 'should be not created without end_date' do
		@sprint.end_date = nil
		expect(@sprint).not_to be_valid
	end

	it 'should be not created without planning_start_date' do
		@sprint.planning_start_date = nil
		expect(@sprint).not_to be_valid
	end

	it 'should be not created without planning_end_date' do
		@sprint.planning_end_date = nil
		expect(@sprint).not_to be_valid
	end

	it 'should be not created without execution_start_date' do
		@sprint.execution_start_date = nil
		expect(@sprint).not_to be_valid
	end	

	it 'should be not created without execution_end_date' do
		@sprint.execution_end_date = nil
		expect(@sprint).not_to be_valid
	end	

	it 'should be not created without review_meeting_date' do
		@sprint.review_meeting_date = nil
		expect(@sprint).not_to be_valid
	end	

	it 'should be not created without retrospective_meeting_date' do
		@sprint.retrospective_meeting_date = nil
		expect(@sprint).to be_valid
	end	
 	
 	it 'should be not created without project_id' do
		@sprint.project_id = nil
		expect(@sprint).not_to be_valid
	end	

 	it 'should be not created without release_id' do
		@sprint.release_id = nil
		expect(@sprint).not_to be_valid
	end	


	it 'should be created with all requirements' do
		expect(@sprint).to be_valid
	end
end


