users = User.order(:created_at).take 6
10.times do
  title = Faker::Lorem.sentence 3
  content = Faker::Lorem.sentence 5
  users.each { |user| user.posts.create!(title: title,content: content) }
end
