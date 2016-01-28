class CreateUserAbilities < ActiveRecord::Migration
  def change
    create_table :user_abilities do |t|
      t.integer :points
      t.references :user, index: true, foreign_key: true
      t.references :ability, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
