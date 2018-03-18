# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Clearing db"

tables = ActiveRecord::Base.connection.tables
tables.delete("schema_migrations")
puts "Truncating tables #{tables * ", "}."

tables.each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table} CASCADE")
end


User.create(first_name: "Admin", email: "admin@admin.com", password: "password")


puts "Creating events"
100.times do
  start_date = Faker::Date.between(Date.today, 6.months.from_now) + rand(18..23).hours
  end_date = start_date + rand(0..2).hours
  performer = Faker::RockBand.name
  location = Faker::Address.city
  Event.create(
    title: "#{performer} at #{location}",
    performer: performer,
    start_date: start_date,
    end_date: end_date,
    location: Faker::Address.city,
    price: Faker::Number.number(3),
    description: Faker::Lorem.paragraph(2)
  )
  print '.'
end
