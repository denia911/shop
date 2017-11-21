# Class for cart, realized: add product, remove product, print a check
class Cart
  def initialize
    @shopping_list = []
  end

  def add(prod, count)
    check_cart(prod, count)
  end

  def delete
    puts 'Enter the name of product'
    prod = gets.chomp
    puts 'Enter the quantity of goods or - all'
    count = gets.chomp
    delete_prod(prod, count)
    @shopping_list.delete_if { |position| position['count'].zero? }
  end

  def check
    puts(print_check)
    print_amount
  end

  private

  def check_cart(prod, count)
    exists = @shopping_list.any? { |position| position['prod'] == prod }
    unless exists
      @shopping_list << { 'prod' => prod, 'count' => count }
      return
    end
    @shopping_list.map do |position|
      position['count'] += count if position['prod'].name == prod.name
    end
  end

  def delete_prod(prod, count)
    exists = @shopping_list.any? { |position| position['prod'].name == prod }
    unless exists
      puts 'There is no such product in your shopping cart'
      return
    end
    delete_check(prod, count)
  end

  def delete_check(prod, count)
    case count
    when 'all'
      @shopping_list.map do |position|
        position['count'] = 0 if position['prod'].name == prod
      end
    else
      @shopping_list.map do |position|
        position['count'] -= count.to_i if position['prod'].name == prod
      end
    end
  end

  def print_amount
    amount = @shopping_list.inject(0) do |result, pos|
      price = pos['count'] >= 3 ? pos['prod'].trade_price : pos['prod'].price
      result + price * pos['count']
    end
    puts "The amount of all purchases is #{amount}"
  end

  def print_check
    @shopping_list.map { |position| [position['prod'].name, position['count']] }
  end
end
