json.extract! @course, :id, :name, :description
json.user do
  json.id @course.user.id
  json.email @course.user.email
  end
json.videos @course.videos do |video|
  json.extract! video, :id, :name, :url
end
