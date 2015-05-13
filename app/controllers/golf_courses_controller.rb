class GolfCoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = GolfCourse.all
  end

  def new
    @course = GolfCourse.new
  end

  def create
    @course = current_user.golf_courses.new(course_params)
    if @course.save
      flash[:notice] = "Course Created Successfully!"
      redirect_to golf_course_path(@course)
    else
      flash[:alert] = "Course Not Created"
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @course }
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course
      flash[:notice] = "Course updated successfully"
    else
      flash[:alert] = "Course not updated"
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to golf_courses_path
    flash[:notice] = "Golf Course Deleted"
  end

  private

  def find_course
    @course = GolfCourse.find params[:id]
  end

  def course_params
    params.require(:golf_course).permit(:name, :address, :golf_course_image)
  end

end
