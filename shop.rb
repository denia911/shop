# Class for shop, or products category list.
class Shop
  attr_reader :name
  attr_reader :categorys_list

  def initialize(name, categorys_list = nil)
    @name = name
    @categorys_list = categorys_list || []
  end
end
