# Class for product.
class Product
  attr_reader :name
  attr_reader :price
  attr_reader :trade_price

  def initialize(name, price, trade_price)
    @name = name
    @price = price
    @trade_price = trade_price
  end
end
