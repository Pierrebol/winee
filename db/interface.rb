require "yaml"
require_relative "scraper"

puts "Fetching URLs"
urls = fetch_wine_urls

wines = urls.map do |url|
  puts "Scraping #{url}"
  scrape_wine(url)
end

# puts "Writing wines.yml"
# File.open("wines.yml", "w") do |f|
#   f.write(wines.to_yaml)
# end

puts "Done."
