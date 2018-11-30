class Invitation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :course
  #belongs_to :sender, class_name: 'User'
  #belongs_to :recipient, class_name: 'User'
  scope :all_by_user, -> (id) { where(user_id: id) }
  before_create :generate_token

  def generate_token
   self.token = Digest::SHA1.hexdigest([self.course_id, Time.now, rand].join)
  end

end
