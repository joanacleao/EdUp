require "byebug"

class CoursesController < ApplicationController

  def index
    @courses = current_user.role.publisher? ? Course.all_by_user(current_user.id) : Invitation.all_by_user(current_user.id)
    @videos = Video.all
  end

  def new
    @course = Course.new
    @course.videos.build
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      redirect_to courses_path, notice: "Your course has been created!"
    else
      render :new, alert: "Could not save your course!"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, videos_attributes: [:name, :url, :path])

    #params.require(:survey).permit(:title, sections_attributes: [:title, questions_attributes:[:title]])
  end

end
