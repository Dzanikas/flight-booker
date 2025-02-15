# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
Airport.destroy_all
Flight.destroy_all

airport_codes = [ "JFK", "LAX", "ORD", "ATL", "DFW", "DEN", "SFO", "SEA", "MIA", "BOS" ]
airports = airport_codes.map { |code| Airport.create!(name: "Airport #{code}", code: code) }

90.times do
  departure_airport, arrival_airport = airports.sample(2)
  Flight.create!(
    departure_airport: departure_airport,
    arrival_airport: arrival_airport,
    departure_time: Faker::Time.forward(days: 30, period: :morning),
    duration_minutes: rand(60..600)
  )
end

puts "Seeded 90 flights successfully!"
