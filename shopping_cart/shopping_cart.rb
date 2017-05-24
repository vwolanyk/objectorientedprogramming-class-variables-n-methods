class ShoppingCart

  require './product_tob_purchased.rb'

  attr_reader :products

  def initialize

    @products = []

  end

  def add_product(name, base_price, tax_rate)
    new_product = Product.new(name, base_price,tax_rate)
    @products << new_product
    new_product
  end

  def remove_product(product_name)

    @products.delete
  end

  def total_before_tax
    total = 0
    @products.each do |product|
      total += product.base_price
    end
    total
  end

    def total_after_tax
      total = 0
      @products.each do |product|
        total += product.total_price
      end
      total
    end


end

my_cart = ShoppingCart.new
my_cart.add_product("Jack Daniels", 15.99, 0.14)
my_cart.add_product("PopCorn", 5.99, 0.12)
my_cart.add_product("fork", 3.25, 0.04)

p my_cart.products.inspect

puts "The total before tax is $#{my_cart.total_before_tax}"
puts "The total after tax is $#{my_cart.total_after_tax}"
puts "Removing Popcorn"
my_cart.remove_product("PopCorn")

p my_cart.products.inspect
