class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :version
      t.date :deliver_date
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
