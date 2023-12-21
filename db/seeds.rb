# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


User.destroy_all
Post.destroy_all
Comment.destroy_all

image_links = [
  "https://images.pexels.com/photos/4050347/pexels-photo-4050347.jpeg?cs=srgb&dl=pexels-vlada-karpovich-4050347.jpg&fm=jpg",
  "https://img.freepik.com/photos-premium/annuaire-telephonique-portable-table-bois_36923-1057.jpg?size=626&ext=jpg",
  "https://img.freepik.com/photos-premium/photo-retour-ecole_896782-15587.jpg",
  "https://st2.depositphotos.com/4107269/7705/i/450/depositphotos_77053677-stock-photo-journalist-working-on-his-new.jpg",
  "https://st3.depositphotos.com/8205786/37240/i/450/depositphotos_372406812-stock-photo-two-girls-in-a-white.jpg",
  "https://st3.depositphotos.com/12548352/16360/i/450/depositphotos_163601446-stock-photo-girl-writing-in-notebook.jpg",
  "https://images.pexels.com/photos/4468150/pexels-photo-4468150.jpeg?cs=srgb&dl=pexels-karolina-grabowska-4468150.jpg&fm=jpg",
  "https://media.istockphoto.com/id/1189962383/photo/contemporary-young-women-working-in-cafe.jpg?s=612x612&w=0&k=20&c=b1rmEdKih4VpOPJrQH1Ki1wE6wkvjmgFSPaPlew_o5w=",
  "https://media.istockphoto.com/id/939031194/fr/photo/portrait-de-souriant-freelance-intelligente-en-v%C3%AAtements-d%C3%A9contract%C3%A9s-et-de-spectacles-en.jpg?s=612x612&w=0&k=20&c=oLsihD45jLWSNTvk-yE0Ag-8_oG6Qb1VSx-MMub-IJE=",
  "https://st4.depositphotos.com/2208684/23747/i/450/depositphotos_237473972-stock-photo-portrait-shot-of-businessman-looking.jpg"
]

compteur = 0

users = []

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "azerty",
    nickname: Faker::Internet.username,
    description: Faker::Lorem.paragraphs(number: 10).join("\n")
  )
  user.save!
  users << user

  post = Post.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentences(number: 5).join(" "),
    content: Faker::Lorem.sentences(number: 20).join("\n"),
    url: Faker::Internet.url,
    user_id: user.id,
    post_photo: image_links[compteur]
  )
  post.save!
  compteur += 1

  2.times do
    Comment.create!(
      content: Faker::Lorem.sentence,
      user_id: user.id,
      post_id: post.id
    )
  end
end

puts "Users, Posts, and Comments finished"
puts "100% finished"
