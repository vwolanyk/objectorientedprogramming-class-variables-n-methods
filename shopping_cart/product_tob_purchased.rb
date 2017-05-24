class Product



  attr_reader :name, :base_price, :tax_rate

  def initialize(name, base_price, tax_rate)
    @name = name
    @base_price = base_price
    @tax_rate = tax_rate
  end

  def total_price
    total = @base_price + (@base_price * @tax_rate)
    total.round(2)
  end

end
