require 'open-uri'
require 'nokogiri'

def fetch_wine_urls
  # top_url = "https://www.twil.fr/france.html?wine_color=Rouge&wine_note_avg_filter=3+et+plus&wine_size=75cl_50cl&wine_vintage=2000_2001_2002_2003_2004_2005_2006_2007_2008_2009_2010_2011_2012_2013_2014_2015_2016_2017_2018_2019_2020_2021"
  top_url = "https://www.twil.fr/france.html?limit=36"
  doc = Nokogiri::HTML(open(top_url).read)
  wines = doc.search(".no-text-decoration.no_focus")
  urls = []
  wines.take(36).map do |wine|
    urls << wine.attributes["href"].value
    # scrape_wine(url)
  end
  counter = 2
  while counter < 4
    url_general = "https://www.twil.fr/france.html?limit=36&p=#{counter}"
    doc = Nokogiri::HTML(open(top_url).read)
    wines = doc.search(".no-text-decoration.no_focus")
    wines.take(36).map do |wine|
      urls << wine.attributes["href"].value
      # scrape_wine(url)
    end
    counter += 1
  end
  return urls
end

def scrape_wine(url)
  doc = Nokogiri::HTML(URI.open(url).read)
  image = ''
  description = ''
  title = nil
  hachette_description = ''
  vineyard = ''
  vintage = ''
  designation = ''
  price = ''
  cepages = ''
  garde = ''
  country = ''

  doc.search("//span[@itemprop = 'brand']").each do |element|
    vineyard = element.text.strip
  end

  doc.search('.wine-name').each do |element|
    title = element.text.strip.gsub("\n",'').gsub(/  .*[A-zÀ-ú]*\w.[A-zÀ-ú]*.[A-zÀ-ú]*$/,'')
  end

  doc.search('.gallery-image').each do |element|
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

  wine = {
    photo: image,
    description: description,
    name: title,
    hachette_description: hachette_description,
    vineyard: vineyard,
    vintage: vintage,
    designation: designation,
    price: price
  }
  return wine
end


# counter = 2
# while counter < 8
#   url_general = "https://www.twil.fr/france.html?p=#{counter}&wine_color=Rouge&wine_note_avg_filter=3+et+plus&wine_size=75cl_50cl&wine_vintage=2000_2001_2002_2003_2004_2005_2006_2007_2008_2009_2010_2011_2012_2013_2014_2015_2016_2017_2018_2019_2020_2021"

#   html_file = URI.open(url_general).read
#   html_doc = Nokogiri::HTML(html_file)

#   html_doc.search('.region').each do |element|
#     region = element.text.strip
#   end

#   html_doc.search('.producer').each do |element|
#     producer = element.text.strip
#   end

#   html_doc.search('.product-name').each do |element|
#     product_name = element.text.strip
#   end

#   html_doc.search('.note_product').each do |element|
#     ratings = element.text.strip
#   end

#   html_doc.search('.price-info').each do |element|
#     price = element.text.strip
#   end

#   {
#     region: region,
#     producer: producer,
#     product_name: product_name,
#     ratings: ratings,
#     price: price
#   }

#   counter += 1
# end

