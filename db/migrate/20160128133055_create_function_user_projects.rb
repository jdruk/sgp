class CreateFunctionUserProjects < ActiveRecord::Migration
  def change
    create_table :function_user_projects do |t|
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :function, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
