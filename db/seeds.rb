
#users = User.all

#Create Wikis
1.times do
    Wiki.create!(
        title: Faker::Internet.user_name(5..10),
        body: Faker::Lorem.characters(20),
        # user: users.sample
        )
    end
    
        
 1.times do
     User.create!(
         email: Faker::Internet.email,
         password: Faker::Internet.password(8)
         )
 end
    
    
    
puts "Seed finished"
puts "Created #{User.count} users"
puts "Created #{Wiki.count} Wikis"