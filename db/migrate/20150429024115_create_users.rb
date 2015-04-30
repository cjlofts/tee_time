class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :phone_number
      t.integer :handicap
      t.text :description

      t.timestamps null: false
    end
  end
end
