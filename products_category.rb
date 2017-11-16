# Class for category of some products.
class ProductsCategory
  attr_reader :name
  attr_reader :products

  def initialize(name, products)
    @name = name
    @products = products
  end

end
