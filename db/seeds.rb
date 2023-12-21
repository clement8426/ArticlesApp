# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'


User.destroy_all
Post.destroy_all
Comment.destroy_all


users = []
5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password",
    nickname: Faker::Internet.username,
    description: Faker::Lorem.paragraphs(number: 10).join("\n")
  )

  file_path = Rails.root.join("app/assets/images/user.jpeg")
  file = File.open(file_path)
  user.photo.attach(io: file, filename: 'user.jpeg', content_type: 'image/jpeg')
  users << user
end


puts "Users finished"

# Create posts
posts = []
users.each do |user|
  2.times do
    post = user.posts.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.sentences(number: 5).join(" "),
      content: Faker::Lorem.sentences(number: 20).join("\n"),
      url: Faker::Internet.url
    )
    post.photo.attach(io: File.open("app/assets/images/article.jpeg"), filename: 'article.jpeg', content_type: 'image/jpeg')
    posts << post
  end
end
puts "Posts finished"

# Create comments
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
puts "Comments finished"

puts "100% finished"
