class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :size
      t.date :start_date
      t.date :end_date
      t.references :local, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
