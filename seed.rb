# This is a file to filling data
require_relative 'product'
require_relative 'shop'
require_relative 'products_category'
apple = Product.new('apple', 7, 6)
pineapple = Product.new('pineapple', 9, 8)
pork = Product.new('pork', 11, 10)
beef = Product.new('beef', 15, 14)
fruits = ProductsCategory.new('fruits', [apple, pineapple])
meat = ProductsCategory.new('meat', [pork, beef])

@shop = Shop.new('shop', [fruits, meat])
