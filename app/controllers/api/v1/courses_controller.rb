class Api::V1::CoursesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_course, only: [ :show, :update, :destroy ]

  def index
    @courses = policy_scope(Course)
  end

  def show
  end

  def update
    if @course.update(course_params)
      render :show
    else
      render_error
    end
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    authorize @course
    if @course.save
      render :show
    else
      render_error
    end
  end

  def destroy
    @course.destroy
    head :no_content
  end


  private

  def set_course
    @course = Course.find(params[:id])
    authorize @course
  end


  def course_params
    params.require(:course).permit(:name, :description)
  end

  def render_error
    render json: { errors: @course.errors.full_messages },
      status: :unprocessable_entity
  end

end
