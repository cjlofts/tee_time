class DropRequest < ActiveRecord::Migration
  def change
    drop_table :requests
  end
end
