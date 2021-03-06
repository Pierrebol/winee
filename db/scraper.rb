require 'open-uri'
require 'nokogiri'

def fetch_wine_urls

  urls = []

  counter = 1
  while counter < 6
    url_general = "https://www.twil.fr/france.html?dir=desc&order=wine_note_avg&p=#{counter}"
    doc = Nokogiri::HTML(open(url_general).read)
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

  doc.search(".product-show-info .gotham-book-important").each do |element|
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
    price_cents: price,
    country: country,
    service: service,
    designation_description: designation_description,
    grape_variety: cepages
  }
  return {wine: wine, photo: image}
end

