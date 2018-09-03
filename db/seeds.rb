#Orders 
OrderItem.delete_all
Order.delete_all

# Products

Product.delete_all

product_scraper = ProductScraper.new

products = product_scraper.find_products

products.each do |product|
  product.save
end

# Shipping Modes

ShippingMode.delete_all

ShippingMode.new(title: 'Regular', price: 5.0).save
ShippingMode.new(title: 'Express', price: 10.0).save
ShippingMode.new(title: 'Priority', price: 15.0).save
