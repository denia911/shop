# This is a file to filling data
require_relative 'product'
require_relative 'shop'
require_relative 'products_category'
fruits = ProductsCategory.new('fruits', [Product.new('apple', 7, 6),
                                         Product.new('pineapple', 9, 8)])
meat = ProductsCategory.new('meat', [Product.new('pork', 11, 10),
                                     Product.new('beef', 15, 14)])

@shop = Shop.new('shop', fruits, meat)
