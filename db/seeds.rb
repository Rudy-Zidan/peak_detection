# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(0..100).each do
  date_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)

  Reading.create!(
    value: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    created_at: date_time,
    updated_at: date_time
  )
end
