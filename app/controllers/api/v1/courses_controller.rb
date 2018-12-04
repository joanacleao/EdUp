class Api::V1::CoursesController < Api::V1::BaseController
  def index
    @courses = policy_scope(Course)
  end

  def show
    #byebug
    @course = Course.find(params[:id])
    authorize @course
  end


end
