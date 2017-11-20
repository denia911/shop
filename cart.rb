# Class for cart, realized: add product, remove product, print a check
class Cart
  def initialize
    @shopping_list = []
  end

  def add(prod, count)
    @prod = prod
    @value = 0
    @count = count
    check_cart(@prod, @count)
  end

  def delete
    puts 'Enter the name of product'
    @prod = gets.chomp
    puts 'Enter the quantity of goods'
    @count = gets.chomp.to_i
    delete_prod(@prod, @count)
  end

  def check
    @check = delete_check
    @check.compact!
    puts(@check.map { |position| [position['prod'].name, position['count']] })
    print_amount
  end

  private

  def check_cart(prod, count)
    if @shopping_list.any? { |position| position['prod'].name == prod }
      @shopping_list.map do |position|
        position['count'] += count if position['prod'].name == prod
      end
    else @shopping_list << { 'prod' => prod, 'count' => count }
    end
  end

  def delete_prod(prod, count)
    if @shopping_list.any? { |position| position['prod'].name == prod }
      @shopping_list.map do |position|
        position['count'] -= count if position['prod'].name == prod
      end
    else puts 'There is no such product in your shopping cart'
    end
  end

  def delete_check
    @shopping_list.map do |position|
      position = nil if position['count'] <= 0
      position
    end
  end

  def print_amount
    @amount = 0
    @shopping_list.map do |position|
      @amount += if position['count'] >= 3
                   position['prod'].trade_price * position['count']
                 else
                   position['prod'].price * position['count']
                 end
    end
    puts "The amount of all purchases is #{@amount}"
  end
end
