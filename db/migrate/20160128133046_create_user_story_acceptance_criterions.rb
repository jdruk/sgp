class CreateUserStoryAcceptanceCriterions < ActiveRecord::Migration
  def change
    create_table :user_story_acceptance_criterions do |t|
      t.text :description
      t.integer :status
      t.references :user_story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
