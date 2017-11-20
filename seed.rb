# This is a file to filling data
require_relative 'product'
require_relative 'shop'
require_relative 'products_category'
apple = Product.new('apple', 7, 6)
pineapple = Product.new('pineapple', 9, 8)
products_fruits = [apple, pineapple]
pork = Product.new('pork', 11, 10)
beef = Product.new('beef', 15, 14)
products_meat = [pork, beef]
fruits = ProductsCategory.new('fruits', products_fruits)
meat = ProductsCategory.new('meat', products_meat)

@shop = Shop.new('shop', [fruits, meat])
