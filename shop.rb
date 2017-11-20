require_relative 'products_category'
# Class for shop, or products category list.
class Shop
  attr_reader :name
  attr_accessor :category_list

  def initialize(name, category_list)
    @name = name
    @category_list = category_list
  end
end
