class Course < ApplicationRecord

  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :invitations, dependent: :destroy
  accepts_nested_attributes_for :videos
  #attr_accessor :name, :description
  scope :all_by_user, -> (id) { where(user_id: id) }
end
