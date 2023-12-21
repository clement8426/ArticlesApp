# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

users = []
5.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: "password",
    nickname: Faker::Internet.username,
    description: Faker::Lorem.sentence
  )
end

p"users finished"


posts = []
users.each do |user|
  2.times do
    posts << user.posts.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      content: Faker::Lorem.paragraphs(number: 3).join("\n"),
      url: Faker::Internet.url
    )
  end
end

p"posts finished"

comments = []
users.each do |user|
  posts.each do |post|
    2.times do
      comments << Comment.create!(
        content: Faker::Lorem.sentence,
        user: user,
        post: post
      )
    end
  end
end

p"comments finished"
p"100% finished"
