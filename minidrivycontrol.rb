# Create a list of rentals
# A rental is only acceptable if the car is not already taken by an other rental
# For each acceptable rental, show the price of the rental


cars_data = [
 {
   "id" => 1,
   "price_per_day" => 2000,
   "price_per_km" => 10
 },
 {
   "id" => 2,
   "price_per_day" => 3000,
   "price_per_km" => 15
 }
]

rentals_data = [
  {
    "id" => 1,
    "car_id" => 2,
    "days" => 3,
    "kms" => 500
  },
  {
    "id" => 2,
    "car_id" => 1,
    "days" => 1,
    "kms" => 100
  },
  {
    "id" => 3,
    "car_id" => 1,
    "days" => 7,
    "kms" => 1200
  }
]

class Rental

  def initialize(id, car_id, days, kms)
    @id = id
    @car_id = car_id
    @days = days
    @kms = kms
  end

end

rentals_array = []

rentals_data.each do |rental_data|
  rental = Rental.new(rental_data["id"], rental_data["car_id"], rental_data["days"], rental_data["kms"])
  rentals_array += [rental]
end

puts rentals_array.to_s
