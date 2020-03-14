# #initialize
#     can initialize a Bank Account (FAILED - 1)
#     initializes with a name (FAILED - 2)
#     always initializes with balance of 1000 (FAILED - 3)
#     always initializes with a status of 'open' (FAILED - 4)
# #deposit
#     can deposit money into its account (FAILED - 5)
#   #display_balance
#     can display its balance (FAILED - 6)
#   #valid?
#     is valid with an open status and a balance greater than 0 (FAILED - 7)
#   #close_account
#     can close its account (FAILED - 8)
require "pry"

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(account_name)
    @name = account_name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end
end