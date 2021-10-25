# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all
50.times do 
    created_at = Faker::Date.backward(days: 365 * 2)
    I = Idea.create(
        title: Faker::Lorem.word,
        description: Faker::Lorem.paragraph,
        created_at: created_at,
        updated_at: created_at,
        
    ) 
end
ideas = Idea.all
puts Cowsay.say("Generated #{ideas.count} ideas", :frogs)