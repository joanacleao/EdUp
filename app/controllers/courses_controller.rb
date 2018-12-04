require "byebug"

class CoursesController < ApplicationController

  def index
    @test = current_user.role.publisher?
    @courses = current_user.role.publisher? ? Course.all_by_user(current_user.id).order('created_at DESC') : Invitation.all_by_user(current_user.id).order('created_at DESC')
    #byebug
    @videos = Video.all
  end

  def show
    @course = Course.find(params[:id])
    @videos = @course.videos.paginate(:page => params[:page], :per_page => 1)
    @token = params[:invitation_token]
    if @token != nil
      invitation = Invitation.find_by_token(@token)
      #invitation.update_column(:user_id, current_user.id )
      invitation.update_column( :status, :accepted)
    end
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
    @course = Course.find(params[:id])

  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to courses_path

  end

  def destroy

    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:id, :name, :description, videos_attributes: [:id, :name, :url, :path, :_destroy])
  end

end
