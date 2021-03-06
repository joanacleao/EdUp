class Course < ApplicationRecord

  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :invitations, dependent: :destroy
  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :invitations, allow_destroy: true
  scope :all_by_user, -> (id) { where(user_id: id) }

  validates :name, presence: true
  validates :description, presence: true
end
