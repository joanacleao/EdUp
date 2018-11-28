class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :invitations, dependent: :destroy
  has_many :courses, dependent: :destroy
  extend Enumerize
  enumerize :role, in: [:publisher, :student], default: :student
end
