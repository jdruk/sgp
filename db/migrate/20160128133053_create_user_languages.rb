class CreateUserLanguages < ActiveRecord::Migration
  def change
    create_table :user_languages do |t|
      t.integer :proficiency
      t.references :user, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
