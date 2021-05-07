# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Idea.destroy_all
Review.destroy_all

NUM = 10
PASSWORD = 'supersecret'

super_user = User.create(
    first_name: 'caleb',
    last_name: 'faul',
    email: 'caleb@faul.com',
    password: PASSWORD
)
10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}@#{last_name}.com",
        password: PASSWORD
    )
end

NUM.times do
    created_at = Faker::Date.backward(days:365 * 5)

    i = Idea.create(
        title: Faker::TvShows::TheITCrowd.quote,
        body: Faker::Lorem.sentence(word_count: 20),
        created_at: created_at,
        updated_at: created_at
    )
end





