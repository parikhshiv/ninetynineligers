class CreateLigers < ActiveRecord::Migration
  def change
    create_table :ligers do |t|
      t.date :birth_date, null: false
      t.string :color
      t.string :name, null: false
      t.string :sex, limit: 1
      t.text :description
      t.timestamps
    end
  end
end
