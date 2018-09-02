Product.delete_all

product_scraper = ProductScraper.new

products = product_scraper.find_products

products.each do |product|
  product.save
end
