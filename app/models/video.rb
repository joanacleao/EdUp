class Video < ApplicationRecord
  belongs_to :course
  #attr_accessor :name, :url, :path, :course_id
  scope :all_by_course, -> (id) { where(course_id: id) }
end
