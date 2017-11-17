# Main paige off program
require_relative 'seed'
require_relative 'cart'
require_relative 'shop'
require_relative 'products_category'
require_relative 'product'
cart = Cart.new
put = 0
puts('To view categories, enter - categories.
To add an item to the shopping cart, enter the product name in the category.
To delete the product, enter - delete
To view the check, enter - check
To end shopping, enter - end')
until put == 'end'
  put = gets.chomp
  if put == 'categories'
    puts(@shop.category_list.map(&:name))
    puts 'Enter the category name in order to see the products'
  elsif put == 'fruits'
    products_f = @shop.category_list.find { |e| e.name == 'fruits' }.products
    puts(products_f.map do |e|
      ["Name #{e.name}", "Price #{e.price}", "Trade price #{e.trade_price}"]
    end)
    puts('Enter product name for buy')
    prod_name = gets.chomp
    puts 'Enter the quantity of goods'
    count = gets.chomp.to_i
    cart.add(products_f.find { |e| e.name == prod_name }, count)
    puts('To view categories, enter - categories.')
  elsif put == 'meat'
    products_m = @shop.category_list.find { |e| e.name == 'meat' }.products
    puts(products_m.map do |e|
      ["Name #{e.name}", "Price #{e.price}", "Trade price #{e.trade_price}"]
    end)
    puts 'Enter product name for buy'
    prod_name = gets.chomp
    puts 'Enter the quantity of goods'
    count = gets.chomp.to_i
    cart.add(products_m.find { |e| e.name == prod_name }, count)
    puts('To view categories, enter - categories.')
  elsif put == 'check'
    cart.check
  elsif put == 'delete'
    cart.delete
  elsif put == 'end'
  end
end
