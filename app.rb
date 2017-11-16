# Main paige off program
require_relative 'seed'
require_relative 'cart'
require_relative 'shop'
require_relative 'products_category'
require_relative 'product'
cart = Cart.new
put = 0
until put == 'end'
  put = gets.chomp
if put == 'categories'
  puts @shop.category_list.map { |e| e.name }
elsif put == 'fruits'
  puts @shop.category_list.find { |e| e.name == 'fruits' }
            .products.map { |e| [e.name, e.price, e.trade_price] }
  puts 'product name'
  prod_name = gets.chomp
  cart.add(@shop.category_list.find { |e| e.name == 'fruits' }
                .products.find { |e| e.name == prod_name })
elsif put == 'meat'
  puts @shop.category_list.find { |e| e.name == 'meat' }.products.map { |e|
    [e.name, e.price, e.trade_price] }
  puts 'product name'
  prod_name = gets.chomp
  puts 'Enter the quantity of goods'
  count = gets.chomp.to_i
  cart.add(@shop.category_list.find { |e| e.name == 'meat' }
               .products.find { |e| e.name == prod_name }, count)
elsif put == 'check'
  cart.check
elsif put == 'delete'
  cart.delete
elsif put == 'end'
end
end
