# Class for shop, or products category list.
require_relative 'products_category'
class Shop
  attr_reader :name
  attr_accessor :fruits
  attr_accessor :meat
  attr_accessor :category_list

  def initialize(name, *category_list)
    @name = name
    @category_list = *category_list
  end
end
