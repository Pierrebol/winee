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

user1 = User.create!(email: "bollack@edhec.com", password: "azerty", address:"33 rue Bonaparte Paris", username: 'Bollack')
user2 = User.create!(email: "gasp@edhec.com", password: "azerty", address: "15 Rue de Lille Paris", username: 'Gasp')
user3 = User.create!(email: "dubet@edhec.com", password: "azerty", address:"204 rue Saint-Maur Paris", username: 'Dubetho')
user4 = User.create!(email: "dez@edhec.com", password: "azerty", address:"Place de la République Paris", username: 'Paul-29')


# puts "Creating Wines (can take some time please wait and dance) ^^... AAAANNNNNNDYYYYYYYYY"
# wine_1 = Wine.new(name: 'Les sables fauves',
#                   grape_variety: 'Sauvignon, colombard, chardonnay et gros manseng',
#                   vineyard: 'Domaine de Laballe',
#                   description: 'Des parfums exotiques du nez à la bouche !',
#                   category: 'Blanc',
#                   price: 7.70,
#                   country: 'France',
#                   year: '2020',
#                   )
# file = URI.open('https://boutique.laballe.fr/348-thickbox_default/les-sables-fauves-x6.jpg')
# wine_1.photo.attach(io: file, filename: 'sables_fauves.jpg', content_type: 'image/jpg')
# wine_1.save


# wine_2 = Wine.new(name: 'Batti Batti',
#                   grape_variety: 'Grenache, cinsault et syrah',
#                   vineyard: 'Saint-Esprit',
#                   description: 'Le rosé qui fait battre notre cœur et nos papilles !',
#                   category: 'Rosé',
#                   price: 9.50,,
#                   country: 'France',
#                   year: '2020'
#                   )
# file_2 = URI.open('https://media.lepetitballon.com/catalog/product/cache/8da67e3c4e050fdb77d809e5c1375e47/b/a/batti-batti-2020-75cl.jpg')
# wine_2.photo.attach(io: file_2, filename: 'battibatti.jpg', content_type: 'image/jpg')
# wine_2.save



# wine_3 = Wine.new(name: 'Syrah',
#                   grape_variety: 'Syrah',
#                   vineyard: 'Domaine Musita',
#                   description: 'La syrah se plie aux charmes maritimes de la Sicile !',
#                   category: 'Rouge',
#                   price: 9.90,
#                   country: 'Italie',
#                   year: '2019'
#                   )
# file_3 = URI.open('https://media-verticommnetwork1.netdna-ssl.com/wines/musita-syrah-sicilia-regieterre-70cl-1609653-s110.jpg')
# wine_3.photo.attach(io: file_3, filename: 'syrah.jpg', content_type: 'image/jpg')
# wine_3.save


# wine_4 = Wine.new(name: 'Rosso Fuoco',
#                   grape_variety: 'Barbera',
#                   vineyard: 'Vite Colte',
#                   description: 'Tout est bon dans le Piémont ',
#                   category: 'Rouge',
#                   price: 12.90,
#                   country: 'Italie',
#                   year: '2019'
#                   )
# file_4 = URI.open('https://www.my-alco-shop.com/58271-large_default/vite-colte-terre-da-barbera-d-asti-rosso-fuoco-2019.jpg')
# wine_4.photo.attach(io: file_4, filename: 'rossofuoco.jpg', content_type: 'image/jpg')
# wine_4.save



# wine_5 = Wine.new(name: 'Saint-Joseph',
#                   grape_variety: 'Syrah',
#                   vineyard: 'Domaine Courbis',
#                   description: 'Un incontournable dans le Rhône !',
#                   category: 'Rouge',
#                   price: 24.50,
#                   country: 'France',
#                   year: '2019'
#                   )
# file_5 = URI.open('https://www.vinatis.com/54878-detail_default/saint-joseph-2019-domaine-courbis.png')
# wine_5.photo.attach(io: file_5, filename: 'saintjoseph.jpg', content_type: 'image/jpg')
# wine_5.save



# wine_6 = Wine.new(name: 'Grand Vernet',
#                   grape_variety: 'Viognier, grenache blanc, clairette, roussanne, marsanne, bourboulenc',
#                   vineyard: 'Domaine Pélaquié',
#                   description: 'Une partition de cépages sur un air parfumé !',
#                   category: 'Rouge',
#                   price: 10.50,
#                   country: 'France',
#                   year: '2020'
#                   )
# file_6 = URI.open('https://www.vinatis.com/52429-thickbox_default/cotes-du-rhone-villages-laudun-2018-domaine-pelaquie.png')
# wine_6.photo.attach(io: file_6, filename: 'grandvernet.jpg', content_type: 'image/jpg')
# wine_6.save


# wine_7 = Wine.new(name: 'El picaro',
#                   grape_variety: 'Tinta de Toro (tempranillo)',
#                   vineyard: 'Matsu',
#                   description: 'Charnu, généreux et ensoleillé, un vin typique d Espagne !',
#                   category: 'Rouge',
#                   price: 9.50,
#                   country: 'Espagne',
#                   year: '2020'
#                   )
# file_7 = URI.open('https://www.alforins.com/catalogo/img_normal/MATT01.jpg')
# wine_7.photo.attach(io: file_7, filename: 'elpicaro.jpg', content_type: 'image/jpg')
# wine_7.save





# puts "Creating wineboxes, should take less time, please be patient ^^"
# Winebox.create!(user: user1, wine: wine_2, quantity_of_wine: 10)
# Winebox.create!(user: user1, wine: wine_4, quantity_of_wine: 20)
# Winebox.create!(user: user1, wine: wine_6, quantity_of_wine: 30)
# Winebox.create!(user: user1, wine: wine_8, quantity_of_wine: 40)
# Winebox.create!(user: user1, wine: wine_10, quantity_of_wine: 50)

# Winebox.create!(user: user2, wine: wine_1, quantity_of_wine: 10)
# Winebox.create!(user: user2, wine: wine_3, quantity_of_wine: 20)
# Winebox.create!(user: user2, wine: wine_5, quantity_of_wine: 30)
# Winebox.create!(user: user2, wine: wine_7, quantity_of_wine: 40)
# Winebox.create!(user: user2, wine: wine_9, quantity_of_wine: 50)

# Winebox.create!(user: user3, wine: wine_1, quantity_of_wine: 10)
# Winebox.create!(user: user3, wine: wine_2, quantity_of_wine: 20)
# Winebox.create!(user: user3, wine: wine_3, quantity_of_wine: 30)
# Winebox.create!(user: user3, wine: wine_4, quantity_of_wine: 40)
# Winebox.create!(user: user3, wine: wine_5, quantity_of_wine: 50)

# Winebox.create!(user: user4, wine: wine_6, quantity_of_wine: 10)
# Winebox.create!(user: user4, wine: wine_7, quantity_of_wine: 20)
# Winebox.create!(user: user4, wine: wine_8, quantity_of_wine: 30)
# Winebox.create!(user: user4, wine: wine_9, quantity_of_wine: 40)
# Winebox.create!(user: user4, wine: wine_10, quantity_of_wine: 50)


# puts "Creating reviews, should take less time, please be patient again zebi^^"
# Review.create!(user: user1, wine: wine_1, comment: "ça casse la gorge et blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_2, comment: "ça casse la gorge et blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_3, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_4, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_5, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_6, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_7, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_8, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user1, wine: wine_9, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)

# Review.create!(user: user2, wine: wine_1, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)
# Review.create!(user: user2, wine: wine_2, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)
# Review.create!(user: user2, wine: wine_3, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)
# Review.create!(user: user2, wine: wine_4, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)
# Review.create!(user: user2, wine: wine_5, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)
# Review.create!(user: user2, wine: wine_6, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)
# Review.create!(user: user2, wine: wine_7, comment: "ça casse la gorge blablablablablablablablablabla" , rating: 2)
# Review.create!(user: user2, wine: wine_8, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)
# Review.create!(user: user2, wine: wine_9, comment: "ça casse la gorge blablablablablablablablablabla", rating: 2)

# Review.create!(user: user3, wine: wine_1, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_2, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_3, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_4, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_5, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_6, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_7, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_8, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user3, wine: wine_9, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)

# Review.create!(user: user4, wine: wine_1, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_2, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_3, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_4, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_5, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_6, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_7, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_8, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)
# Review.create!(user: user4, wine: wine_9, comment: "ça casse la gorge blablablablablablablablablabla", rating: 5)

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


wine_8 = Wine.new(name: 'Brastis pastis breton',
                  grape_variety: 'Pastis',
                  vineyard: 'Brastis',
                  description: 'Avec sa bouteille en forme de phare, ce pastis breton fera sensation auprès de vos convives lors de vos apéros, vos barbecues d été et vos parties de pétanque !',
                  category: 'Spiritueux',
                  price_cents: 32.90,
                  country: 'Bretagne',
                  year: '2020'
                  )
file_8 = URI.open('https://vandb-vandb-fr-storage.omn.proximis.com/Imagestorage/imagesSynchro/0/0/bd7b53f53b53b18ef7815c74b44853624e65d883_6963SAB030072_1.png')
wine_8.photo.attach(io: file_8, filename: 'brastis.jpg', content_type: 'image/jpg')
wine_8.save



wine_9 = Wine.new(name: 'Rhum Clément - Vieux VO',
                  grape_variety: 'Rhum agricole',
                  vineyard: 'Rhum Clément',
                  description: 'Bien équilibré',
                  category: 'Spiritueux',
                  price_cents: 34,
                  country: 'Martinique',
                  year: '2020'
                  )
file_9 = URI.open('https://media.cdnws.com/_i/21035/1614/3826/15/hw755-vo.jpeg')
wine_9.photo.attach(io: file_9, filename: 'rhumclement.jpg', content_type: 'image/jpg')
wine_9.save


wine_10 = Wine.new(name: 'Gin Citadelle',
                   grape_variety: 'Gin',
                   vineyard: 'Citadelle',
                   description: 'Une merveille qui va même sans son tonic !',
                   category: 'Spiritueux',
                   price_cents: 3100,
                   country: 'France',
                   year: '2020'
                  )
file_10 = URI.open('https://www.whisky.fr/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/m/1/m1670a_1.jpg')
wine_10.photo.attach(io: file_10, filename: 'citadelle.jpg', content_type: 'image/jpg')
wine_10.save


wine_11 = Wine.new(name: 'Bombay Sapphire',
                   grape_variety: 'Gin',
                   vineyard: 'Bombay Sapphire',
                   description: 'Une merveille qui va même sans son tonic !',
                   category: 'Spiritueux',
                   price_cents: 2400,
                   country: 'France',
                   year: '2020'
                  )
file_11 = URI.open('https://media-verticommnetwork1.netdna-ssl.com/wines/bombay-sapphire-434353.jpg')
wine_11.photo.attach(io: file_11, filename: 'bombay.jpg', content_type: 'image/jpg')
wine_11.save


wine_12 = Wine.new(name: 'Nikka from the Barrel',
                   grape_variety: 'Whisky',
                   vineyard: 'Nikka',
                   description: 'Une merveille avec quelques pierres et un bon cigare !',
                   category: 'Spiritueux',
                   price_cents: 4900,
                   country: 'France',
                   year: '2020'
                  )
file_12 = URI.open('https://www.laroutedesvins.com/658-big_default_2x/nikka-from-the-barrel-cask-50cl-51-4.jpg')
wine_12.photo.attach(io: file_12, filename: 'nikka.jpg', content_type: 'image/jpg')
wine_12.save



wine_13 = Wine.new(name: 'Martini Bianco',
                   grape_variety: 'Martini',
                   vineyard: 'Martini',
                   description: 'Une merveille qui va même sans son tonic !',
                   category: 'Spiritueux',
                   price_cents: 1200,
                   country: 'Italie',
                   year: '2020'
                  )
file_13 = URI.open('https://media-verticommnetwork1.netdna-ssl.com/wines/martini-bianco-1l-436238.jpg')
wine_13.photo.attach(io: file_13, filename: 'martini.jpg', content_type: 'image/jpg')
wine_13.save



wine_14 = Wine.new(name: 'Trois Rivière',
                   grape_variety: 'Rhum',
                   vineyard: 'Rhum',
                   description: 'Une merveille qui va même sans son tonic !',
                   category: 'Spiritueux',
                   price_cents: 1500,
                   country: 'France',
                   year: '2020'
                  )
file_14 = URI.open('https://images-na.ssl-images-amazon.com/images/I/712RTl7oFRL._AC_SL1500_.jpg')
wine_14.photo.attach(io: file_14, filename: '3rivières.jpg', content_type: 'image/jpg')
wine_14.save


wine_15 = Wine.new(name: 'William Peel',
                   grape_variety: 'Whisky',
                   vineyard: 'William Peel',
                   description: 'À boire à température ambiante, ou réchauffé 30 secondes au micro-ondes. Avec une larme de coca-cola !',
                   category: 'Spiritueux',
                   price_cents: 1500,
                   country: 'France',
                   year: '2020'
                  )
file_15 = URI.open('https://www.williampeel.com/content-assets/uploads/2016/04/william-peel-blended-scotch-whisky.png')
wine_15.photo.attach(io: file_15, filename: 'peel.jpg', content_type: 'image/jpg')
wine_15.save


wine_16 = Wine.new(name: 'Get 27',
                   grape_variety: 'Spiritueux',
                   vineyard: 'Get',
                   description: 'Bien frais avec des glaçons !',
                   category: 'Spiritueux',
                   price_cents: 1300,
                   country: 'France',
                   year: '2020'
                  )
file_16 = URI.open('https://images.plugwine.com/2/20862/zoom_20171106152410.405-2220477070.jpg')
wine_16.photo.attach(io: file_16, filename: 'get.jpg', content_type: 'image/jpg')
wine_16.save

wine_17 = Wine.new(name: 'Diplomatico',
                   grape_variety: 'Rhum',
                   vineyard: 'Get',
                   description: 'Bien frais avec des glaçons !',
                   category: 'Spiritueux',
                   price_cents: 3000,
                   country: 'France',
                   year: '2020'
                  )
file_17 = URI.open('https://legroscaviste.com/74679-large_default/rhum-diplomatico-reserva-exclusiva-jeroboam.jpg')
wine_17.photo.attach(io: file_17, filename: 'get.jpg', content_type: 'image/jpg')
wine_17.save


wine_18 = Wine.new(name: 'Cointreau',
                   grape_variety: 'Apéritif',
                   vineyard: 'Cointreau',
                   description: 'Bien frais avec des glaçons !',
                   category: 'Spiritueux',
                   price_cents: 1600,
                   country: 'France',
                   year: '2020'
                  )
file_18 = URI.open('https://upload.wikimedia.org/wikipedia/commons/8/8a/Coinreau_original_v4.jpg')
wine_18.photo.attach(io: file_18, filename: 'cointreau.jpg', content_type: 'image/jpg')
wine_18.save


puts "Done."
