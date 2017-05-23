class BankAccount

  # Class Variables
  @@interest_rate = 0.01
  @@accounts = []

  # Read Write Variables
  attr_accessor :balance

  # Read Accounts Array
  def self.accounts
    @@accounts
  end

  # Class Methods

  # Create a new account
  def self.create

    new_account = BankAccount.new

    @@accounts << new_account

    new_account

  end

  # Find Total of all Accounts
  def self.total_funds
    total_funds = 0.0

    @@accounts.each do |account|
      total_funds += account.balance
    end

    total_funds
  end

    # Apply Interest to Balances of All Accounts
    def self.interest_time

      @@accounts.each do |account|
        account.balance += @@interest_rate * account.balance
      end
    end

  # Instance Methods

  # Account Initialize
  def initialize

    @balance = 0.0
  end

  # Account Deposit
  def deposit(deposit_amount)

    @balance += deposit_amount
  end

  # Account Withdraw
  def withdraw(withdraw_amount)

    @balance -= withdraw_amount
  end


end
  # Test Case

#   my_account = BankAccount.create
#   your_account = BankAccount.create
#
#   puts my_account.balance
#   puts your_account.balance
#
#   p BankAccount.accounts
#
#   puts BankAccount.total_funds
#
#   puts "Depositing 200 and 1000 bucks"
#
#   my_account.deposit(200)
# your_account.deposit(1000)
# puts my_account.balance # 200
# puts your_account.balance # 1000
# puts BankAccount.total_funds # 1200
# BankAccount.interest_time
# puts my_account.balance # 202.0
# puts your_account.balance # 1010.0
# puts BankAccount.total_funds # 1212.0
# my_account.withdraw(50)
# puts my_account.balance # 152.0
# puts BankAccount.total_funds # 1162.0
