require "yaml"
require_relative "scraper"
require 'json'
require "open-uri"


# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
DeliveryProduct.destroy_all
Review.destroy_all
Delivery.destroy_all
OrderWine.destroy_all
Review.destroy_all
Winebox.destroy_all
Wine.destroy_all
Order.destroy_all
User.destroy_all


puts "Creating Users..."

user1 = User.create!(email: "bollack@edhec.com", password: "azerty", address:"33 rue Bonaparte Paris", username: 'Bobolalackiki')
user2 = User.create!(email: "gasp@edhec.com", password: "azerty", address: "15 Rue de Lille Paris", username: 'Leplusbg')
user3 = User.create!(email: "dubet@edhec.com", password: "azerty", address:"204 rue Saint-Maur Paris", username: 'chienhaineux78')
user4 = User.create!(email: "dez@edhec.com", password: "azerty", address:"Place de la République Paris", username: 'Zuuuubi')


puts "Fetching URLs"
urls = fetch_wine_urls

wines = urls.map do |url|
  puts "Scraping #{url}"
  data = scrape_wine(url)
  wine = Wine.create(data[:wine])
  file = URI.open(data[:photo])
  wine.photo.attach(io: file, filename: 'sables_fauves.jpg', content_type: 'image/jpg')
  wine.save!
end

puts "Done."
