# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
25.times do |i|
  user = User.create!(name: "User", email: "email#{i + 1}@example.com")
  link = Link.create!(title: Faker::Internet.domain_word, url: Faker::Internet.url, user_id: user.id)

  10.times do
    if rand > 0.5
      Upvote.create!(user_id: user.id, link_id: link.id)
    else
      Downvote.create!(user_id: user.id, link_id: link.id)
    end
  end
end
