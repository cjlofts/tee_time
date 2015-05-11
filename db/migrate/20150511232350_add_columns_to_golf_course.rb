class AddColumnsToGolfCourse < ActiveRecord::Migration
  def change
    add_column :golf_courses, :address, :string
    add_column :golf_courses, :longitude, :float
    add_column :golf_courses, :latitude, :float
  end
end
