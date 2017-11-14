# Class for product.
class Product
  attr_reader :name
  attr_reader :price
  attr_reader :trade_price

  def initialize(name, price)
    @name = name
    @price = price
    @trade_price = price / 2
  end
end
