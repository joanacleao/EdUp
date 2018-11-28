# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

Invitation.destroy_all
Course.destroy_all
User.destroy_all
Video.destroy_all


publishers = []
3.times do
  publisher = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      #role: User.role,
      email: Faker::Internet.email,
      password: "12345a1!" )
  publisher.role = User.role.publisher
  publisher.save!
  publishers << publisher
end

students = []
3.times do
student = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    #role: "student",
    email: Faker::Internet.email,
    password: "12345a1!" )
students << student
end

courses = []
3.times do
course = Course.new(
  name: Faker::Educator.course,
  description: Faker::Lorem.sentence(3)
  )
course.user = publishers.sample
course.save!
courses << course
end

videos = []
courses.each do |course|
  3.times do
    video = Video.new(
      name: Faker::Lorem.sentence(3),
      url: Faker::Internet.url
      )
    video.course = course
    video.save!
    videos << video
  end
end

invitations = []
  3.times do
    invitation = Invitation.new(
      message: Faker::Lorem.sentence(3),
      status: ["pending", "accepted"].sample
      )
    invitation.course = courses.sample
    invitation.user = students.sample
    invitation.save!
    invitations << invitation
  end














