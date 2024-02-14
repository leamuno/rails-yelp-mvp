puts 'destroying current instances...'
Restaurant.destroy_all

puts 'Creating 5 instances...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: Restaurant::CATEGORIES.sample,
    description: Faker::Restaurant.description
  )
  restaurant.url = "http://source.unsplash.com/featured/?#{restaurant.category.downcase}&#{rand(1000)}"
  restaurant.save
end

restaurants = Restaurant.all
30.times do
  Review.create(
    content: Faker::Restaurant.review,
    restaurant: restaurants.sample,
    rating: Review::RATINGS.sample
  )
end

puts "Created #{Restaurant.count} restaurants"
