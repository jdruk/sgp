class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.text :description
      t.integer :scope

      t.timestamps null: false
    end
  end
end
