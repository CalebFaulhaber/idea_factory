# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUM = 10
PASSWORD = 'supersecret'


NUM.times do
    created_at = Faker::Date.backward(days:365 * 5)

    i = Idea.create(
        title: Faker::TvShows::TheITCrowd.quote,
        body: Faker::Lorem.sentence(word_count: 20),
        created_at: created_at,
        updated_at: created_at
    )
end
