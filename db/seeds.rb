# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

def handle_string_io_as_file(io, filename)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

puts 'Destroying all users, bookings, and nannies...'
Booking.destroy_all
Nanny.destroy_all
User.destroy_all


sleep(2)
puts 'Creating new nannies from Le Wagon alumni...'
sleep(2)

users = []
cities = ["Barcelona", "Dakar", "Brussels", "New York", "Berlin", "Tel Aviv", "Cape Town", "Sevilla", "Amsterdam"]

40.times do
  users << User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::Internet.username)
end
users.each do |user|
  nanny = Nanny.create(
    user: user,
    price_per_hour: rand(10..45),
    description: Faker::TvShows::BojackHorseman.quote,
    age: rand(18..60),
    city: cities.sample)
  url = "https://kitt.lewagon.com/placeholder/users/random"
  alumni = URI.open(url)
  nanny.photo.attach(io: handle_string_io_as_file(alumni, 'image.png'), filename: "Student #{user.id}", content_type: 'image/png')
end

puts 'Finished!'
