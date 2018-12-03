class InvitationsController < ApplicationController

  def index
    @invitations = Invitation.all_by_course(params[:course_id])
  end



  def show

  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.course = Course.find_by_id(params[:course_id])

    if @invitation.save

      #if the user already exists
      if @invitation.user_id != nil

        #send a notification email
        InviteMailer.existing_user_invite(@invitation, course_path(params[:course_id], :invitation_token => @invitation.token)).deliver

      else
        InviteMailer.new_user_invite(@invitation, new_user_registration_path(:invitation_token => @invitation.token)).deliver
      end

    else
      # oh no, creating an new invitation failed
    end

  end

  def destroy
  end

  private

    def invitation_params
      params.require(:invitation).permit(:id, :email, :description, :course_id)
    end


end
