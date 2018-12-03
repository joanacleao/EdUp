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

    #check if this user has already been invited to this course
    user_id = User.find_by_email(invitation_params[:email])
    @previous_invitation = Invitation.all_by_course(params[:course_id]).all_by_user(user_id).last
    if previous_invitation =! nil
      InviteMailer.existing_user_invite(@previous_invitation, course_path(params[:course_id], invitation_token: @previous_invitation.token)).deliver
    else

    if @invitation.save

      #if the user already exists
      if @invitation.user_id != nil

        #send a notification email
        InviteMailer.existing_user_invite(@invitation, course_path(params[:course_id], invitation_token: @invitation.token)).deliver

      else
        InviteMailer.new_user_invite(@invitation, new_user_registration_path(invitation_token: @invitation.token)).deliver
      end

      else
        # oh no, creating an new invitation failed
      end
    end

  end

  def destroy
  end

  private

    def invitation_params
      params.require(:invitation).permit(:id, :email, :description, :course_id)
    end


end
