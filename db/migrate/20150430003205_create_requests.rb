class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requested_user_id
      t.references :user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
