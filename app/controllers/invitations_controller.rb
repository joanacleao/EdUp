class InvitationsController < ApplicationController
    def show
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.course = Course.find_by_id(params[:course_id])
    #byebug
    #@invitation.user = current_user
    if @invitation.save
      InviteMailer.new_user_invite(@invitation, new_user_registration_path(:invitation_token => @invitation.token)).deliver

    else

    end

  end

  def destroy
  end

  private

    def invitation_params
      params.require(:invitation).permit(:id, :email, :description, :course_id)
    end


end
