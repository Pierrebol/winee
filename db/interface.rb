# require "yaml"
# require_relative "scraper"
# require 'json'

# puts "Fetching URLs"
# urls = fetch_wine_urls

# wines = urls.map do |url|
#   puts "Scraping #{url}"
#   data = scrape_wine(url)
#   p data
#   wine = Wine.create!(data[:wine])
#   p wine
#   file = URI.open(data[:photo])
#   p file
#   wine.photo.attach(io: file, filename: 'sables_fauves.jpg', content_type: 'image/jpg')
#   wine.save!
# end
# # p wines

# # puts "Writing wines.json"
# # File.open("wines.json", "wb") do |f|
# #   f.write(JSON.generate(wines))
# # end

# puts "Done."

