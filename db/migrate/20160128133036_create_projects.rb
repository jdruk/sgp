class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :size
      t.datetime :start_date
      t.datetime :end_date
      t.references :local, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
