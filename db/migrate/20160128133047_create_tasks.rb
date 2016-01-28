class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.date :end_date
      t.date :start_date
      t.integer :status
      t.references :user_story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
