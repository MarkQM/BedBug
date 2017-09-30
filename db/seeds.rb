# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RentalProperty.delete_all

RentalProperty.create!(title: "Lovely cottage by the sea", description: "Waterfront view.  'Cozy', which basically means small, but you're here for the view anyway, right?  Sleeps four.  No pets allowed.", bedrooms: 2, beds: 2, maxpersons: 4, bathrooms: 1, pets_allowed: false, address: "Rockport, ME", price: 120.50, latitude: 44.1845, longitude: -69.0761)
RentalProperty.create!(title: "Remote cabin for escaping everything", description: "Adirondack cabin with one double bedroom and a sofa, for when you want that third wheel along for the ride.  Beware the bears.", bedrooms: 1, beds: 2, maxpersons: 3, bathrooms: 1, pets_allowed: false, address: "Keene, NY", price: 203.87, latitude: 44.2562, longitude: -73.7921)
RentalProperty.create!(title: "Loft apartment", description: "Apartment in a converted warehouse above two restaurants and a bar.  Amazingly quite for all that activity downstairs.", bedrooms: 1, beds: 1, maxpersons: 2, bathrooms: 1, pets_allowed: true, address: "Albany, NY", price: 99.99, latitude: 42.6526, longitude: -75.7562)
RentalProperty.create!(title: "Single family home, quiet neighborhood", description: "Two story house with 3 bedrooms (one queen and two twins), kids toys, a big backyard, and quiet neighborhood.  Walking distance to everything and nothing, all at once.  One full bath and one quarter bath.", bedrooms: 3, beds: 3, maxpersons: 4, bathrooms: 2, pets_allowed: false, address: "Hamilton, NY", price: 175.13, latitude: 42.8270, longitude: -75.5446)
RentalProperty.create!(title: "Sofa at former coffee shop", description: "Comfy sofa available for rent in a studio setting: the former Barge Canal coffee shop.  Just need to figure out how to pick the lock, but it's quiet and comfy.  Some crumbs left over from former tenants.  No coffee left, but you're better off going elsewhere anyway.", bedrooms: 0, beds: 1, maxpersons: 1, bathrooms: 0, pets_allowed: true, address: "Hamilton, NY", price: 13.99, latitude: 42.8270, longitude: -75.5446)
