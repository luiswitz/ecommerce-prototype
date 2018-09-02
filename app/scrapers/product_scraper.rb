class ProductScraper
  def initialize(html = nil)
    @html = html
  end

  def find_products
    page.css('.glossary').search('dt').map do |node|
      build_product(node)
    end
  end

  private

  def build_product(node)
    product = Product.new
    
    product.title = node.text.strip
    product.description = normalize_text(node.next_element.text.strip)
    product.image_url = "#{base_url}/#{node.children.first.attr('src')}"
    product.price = rand(1..11)

    product
  end

  def page
    if html
      return Nokogiri::HTML(html)
    end

    Nokogiri::HTML(open(url))
  end
  
  def url
    "#{base_url}/#{catalog_path}"
  end

  def base_url
    'http://www.greatgrubclub.com'
  end

  def catalog_path
    'a-z-fruit-veg#.W4sPo5NKjOR'
  end

  def normalize_text(text)
    text
      .encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      .delete('^a-zA-Z ')
  end

  attr_accessor :html
end
