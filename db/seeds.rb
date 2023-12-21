# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


Post.destroy_all
Comment.destroy_all
User.destroy_all

post_links = [
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
user_links = [
  "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1703030400&semt=ais",
  "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?cs=srgb&dl=pexels-italo-melo-2379005.jpg&fm=jpg",
  "https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-614810.jpg&fm=jpg",
  "https://media.istockphoto.com/id/1372641621/photo/portrait-of-a-businessman-on-gray-background.jpg?s=612x612&w=0&k=20&c=G7RmU1vHuzqIscJDOVrUVRl_-yIOIl0ws3f4RRc8qHU=",
  "https://static.vecteezy.com/system/resources/previews/003/491/890/non_2x/closeup-face-portrait-of-pretty-blonde-girl-with-fresh-skin-horizontal-image-free-photo.jpg",
  "https://jooinn.com/images/3d-girl-portrait-3.jpg",
  "https://images.pexels.com/photos/2613260/pexels-photo-2613260.jpeg?cs=srgb&dl=pexels-ali-pazani-2613260.jpg&fm=jpg",
  "https://i.pinimg.com/736x/81/f8/6c/81f86c18b9fb887317e13995fbf6cc1f.jpg",
  "https://i.pinimg.com/736x/86/71/2c/86712c06b13868dfa8b04def81242c39.jpg"
]

compteur = 0

users = []

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "azerty",
    nickname: Faker::Internet.username,
    description: Faker::Lorem.paragraphs(number: 10).join("\n"),
    user_photo: user_links[compteur]
  )
  user.save!
  users << user

  post = Post.create(
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.sentences(number: 5).join(" "),
    content: Faker::Lorem.sentences(number: 20).join("\n"),
    url: Faker::Internet.url,
    user_id: user.id,
    post_photo: post_links[compteur]
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
