# Main paige off program
require_relative 'seed'
require_relative 'cart'
require_relative 'shop'
require_relative 'products_category'
require_relative 'product'
cart = Cart.new
put = nil
puts('To view categories, enter - categories.
To add an item to the shopping cart, enter the product name in the category.
To delete the product, enter - delete
To view the check, enter - check
To end shopping, enter - end')
until put == 'end'
  put = gets.chomp
  case put
  when 'categories'
    puts(@shop.category_list.map(&:name))
    puts 'Enter the category name in order to see the products'
  when 'meat', 'fruits'
    products = @shop.category_list.find { |cat| cat.name == put }.products
    products.each do |prod|
      puts "Name #{prod.name}\nPrice #{prod.price}\nTrPrice #{prod.trade_price}"
    end
    puts('Enter product name for buy')
    prod_name = gets.chomp
    puts 'Enter the quantity of goods'
    count = gets.chomp.to_i
    cart.add(products.find { |prod| prod.name == prod_name }, count)
    puts('To view categories, enter - categories.')
  when 'check'
    cart.check
  when 'delete'
    cart.delete
  end
end
