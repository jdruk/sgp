class AddReferencesToProject < ActiveRecord::Migration
  def change
    add_reference :user_stories, :project, index: true, foreign_key: true
  end
end
