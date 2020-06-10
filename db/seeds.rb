# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Visit.destroy_all
User.destroy_all


puts "Creating visit..."
30.times do
    user = {
    email: ,
    password: 
    }
    visit =  {
    title: ,
    description: ,
    price: ,
    place: ,
    tag:,
    user_id: user.id
    }

    user2 = {
    email: ,
    password: 
    }

    booking = {
    checking_date:
    checkout_date:
    user_id: user2.id
    visit_id: visit.id
    }

    [user, visit, user2].each do |attributes|
    tour = Tour.create!(attributes) #booking?
    end
end
puts "Finished!"
puts "#{Tour.count} tours created"