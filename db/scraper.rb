require 'open-uri'
require 'nokogiri'

def fetch_wine_urls
  # top_url = "https://www.twil.fr/france.html?wine_color=Rouge&wine_note_avg_filter=3+et+plus&wine_size=75cl_50cl&wine_vintage=2000_2001_2002_2003_2004_2005_2006_2007_2008_2009_2010_2011_2012_2013_2014_2015_2016_2017_2018_2019_2020_2021"
  top_url = "https://www.twil.fr/france.html?limit=36"
  doc = Nokogiri::HTML(open(top_url).read)
  wines = doc.search(".no-text-decoration.no_focus")
  urls = []
  wines.take(10).map do |wine|
    urls << wine.attributes["href"].value
    # scrape_wine(url)
  end
#   counter = 2
#   while counter < 4
#     url_general = "https://www.twil.fr/france.html?limit=36&p=#{counter}"
#     doc = Nokogiri::HTML(open(top_url).read)
#     wines = doc.search(".no-text-decoration.no_focus")
#     wines.take(36).map do |wine|
#       urls << wine.attributes["href"].value
#       # scrape_wine(url)
#     end
#     counter += 1
#   end
   return urls
end

def scrape_wine(url)
  doc = Nokogiri::HTML(URI.open(url).read)
  image = ''
  description = ''
  title = ''
  hachette_description = ''
  vineyard = ''
  vintage = ''
  designation = ''
  price = ''
  cepages = ''
  garde = ''
  service = ''
  country = "France"
  designation_description = ''
  category = ''

  doc.search("//span[@itemprop = 'brand']").each do |element|
    vineyard = element.text.strip
  end

  doc.search("//meta[@itemprop = 'color']").each do |element|
    category = element.attributes["content"].value.capitalize
  end

  doc.search('.wine-name').each do |element|
    title = element.text.strip.gsub("\n",'').gsub(/  .*[A-zÀ-ú]*\w.[A-zÀ-ú]*.[A-zÀ-ú]*$/,'')
  end

  doc.search('#image-0').each do |element|
    image = element.attributes["src"].value
  end

  doc.search("//span[@itemprop = 'productionDate']").each do |element|
    vintage = element.text.strip
  end

  doc.search('#wine-description').each do |element|
    description = element.text.strip
  end

  doc.search('.default_color').each do |element|
    hachette_description = element.text.strip
  end

  doc.search('a.default_color').each do |element|
    designation = element.text.strip
  end

  doc.search('.price').each do |element|
    price = element.text.strip.gsub(/ €/,'').gsub(',','').to_i
  end

  doc.search('.product-details-eat').each do |element|
    service = element.text.strip.gsub("\n",'')
  end

  doc.search('#appellation-panel p').each do |element|
    designation_description = element.text.strip
  end

  doc.search('.cepages .col-xs-7').each do |element|
    cepages = element.text.strip
  end

  wine = {
    description: description,
    name: title,
    category: category,
    hachette_description: hachette_description,
    vineyard: vineyard,
    year: vintage,
    designation: designation,
    price: price,
    country: country,
    service: service,
    designation_description: designation_description,
    grape_variety: cepages
  }
  return {wine: wine, photo: image}
end

