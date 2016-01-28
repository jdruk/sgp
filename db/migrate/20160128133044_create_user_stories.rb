class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.text :description
      t.integer :business_value
      t.integer :story_points
      t.integer :status
      t.references :theme, index: true, foreign_key: true
      t.references :sprint, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
