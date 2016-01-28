class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.date :start_date
      t.date :end_date
      t.date :planning_start_date
      t.date :planning_end_date
      t.date :execution_start_date
      t.date :execution_end_date
      t.date :review_meeting_date
      t.date :retrospective_meeting_date
      t.references :project, index: true, foreign_key: true
      t.references :release, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
