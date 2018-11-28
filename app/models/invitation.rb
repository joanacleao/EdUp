class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :course
  scope :all_by_user, -> (id) { where(user_id: id) }
end
