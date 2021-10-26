# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Like.destroy_all
User.destroy_all
Review.destroy_all
Idea.destroy_all
PASSWORD = '123'
super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    is_admin: true
)
5.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name:first_name,
        last_name: last_name,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD
    )
end

users = User.all
50.times do 
    created_at = Faker::Date.backward(days: 365 * 2)
    I = Idea.create(
        title: Faker::Lorem.word,
        description: Faker::Lorem.paragraph,
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
        
    ) 
    if I.valid?
        rand(1..6).times do 
            Review.create(body:Faker::Lorem.paragraph,idea:I , user: users.sample)
        end
        I.likers = users.shuffle.slice(0, rand(users.count))
    end
end
reviews = Review.all
ideas = Idea.all
puts Cowsay.say("Generated #{ideas.count} ideas", :frogs)
puts reviews.count
puts Cowsay.say("Generated #{users.count} users", :koala)
puts Cowsay.say("Generated #{Like.count} likes", :dragon)
