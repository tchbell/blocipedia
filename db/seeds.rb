4.times do
    User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password(8)
        )
    end
        
5.times do
    Wiki.create!(
        title: Faker::Lorem.characters(10),
        body: Faker::Lorem.paragraph
        )
    end

puts "#{User.count} created"
puts "#{Wiki.count} created"
