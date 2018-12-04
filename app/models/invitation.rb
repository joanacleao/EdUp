class Invitation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :course
  #belongs_to :sender, class_name: 'User'
  #belongs_to :recipient, class_name: 'User'
  scope :all_by_user, -> (id) { where(user_id: id) }
  scope :all_by_course, -> (id) { where(course_id: id) }
  before_create :generate_token
  before_save :check_user_existence
  extend Enumerize
  enumerize :status, in: [:accepted, :pending], default: :pending

  def generate_token
    #token = Invitation.all_by_course(self.course_id).all_by_user(self.user_id).last.token
    #if token != nil
      #self.token = token
    #else
      self.token = Digest::SHA1.hexdigest([self.course_id, Time.now, rand].join)
    #end
  end

  def check_user_existence
    recipient = User.find_by_email(email)
    if recipient
      self.user_id = recipient.id
   end
 end

end
