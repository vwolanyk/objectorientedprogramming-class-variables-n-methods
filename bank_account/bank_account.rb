class BankAccount

  @@interest_rate = 0.0
  @@accounts = []

  attr_accessor :balance

  def initialize
    @balance = 0.0

end
