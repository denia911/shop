# Class for cart, realized: add product, remove product, print a check
class Cart
  def initialize
    @shopping_list = []
  end

  def add(prod, count)
    @prod = prod
    @value = 0
    @count = count
    check_cart(@prod, @count, @value)
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
    puts(@check.map { |e| [e[0].name, e[1], e[2]] })
    @amount = 0
    @check.map { |e| @amount += e[2] }
    puts "The amount of all purchases is #{@amount}"
  end

  private

  def check_cart(prod, count, value)
    if @shopping_list.map { |e| e[0].name }.any? { |e| e == prod.name }
      @shopping_list.map do |e|
        e[1] += count if e[0].name == prod.name
      end
    else @shopping_list << [prod, count, value]
    end
  end

  def delete_prod(prod, count)
    if @shopping_list.map { |e| e[0].name }.any? { |e| e == prod }
      @shopping_list.map do |e|
        e[1] -= count if e[0].name == prod
      end
    else puts 'There is no such product in your shopping cart'
    end
  end

  def delete_check
    @shopping_list.map do |e|
      if e[1] >= 3
        e[2] = e[0].trade_price * e[1]
      elsif e[1] <= 0
        e = nil
      else
        e[2] = e[0].price * e[1]
      end
      e
    end
  end
end
