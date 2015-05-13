class AddGolfCourseImageToGolfCourse < ActiveRecord::Migration
  def change
    add_column :golf_courses, :golf_course_image, :string
  end
end
