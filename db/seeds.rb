Restaurant.destroy_all

CATEGORIES = %w[chinese italian japanese french belgian].freeze

10.times do
  name = Faker::Restaurant.name
  address = Faker::Address.street_address + ', ' + Faker::Address.city
  phone_number = Faker::PhoneNumber.cell_phone
  category = CATEGORIES.sample

  restaurant = Restaurant.create(name: name, address: address, phone_number: phone_number, category: category)

  5.times do
    content = Faker::Restaurant.review
    rating = [*0..5].sample
    review = Review.new(content: content, rating: rating)
    review.restaurant = restaurant
    review.save
  end
end
