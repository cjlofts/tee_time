class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.time :time
      t.references :user, index: true, foreign_key: true
      t.references :golf_course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
