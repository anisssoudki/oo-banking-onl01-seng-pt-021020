
# Transfer
#   initialize
#     can initialize a Transfer (FAILED - 9)
#     initializes with a sender (FAILED - 10)
#     initializes with a receiver (FAILED - 11)
#     always initializes with a status of 'pending' (FAILED - 12)
#     initializes with a transfer amount (FAILED - 13)
#   #valid?
#     can check that both accounts are valid (FAILED - 14)
#     calls on the sender and receiver's #valid? methods (FAILED - 15)
#   #execute_transaction
#     can execute a successful transaction between two accounts (FAILED - 16)
#     each transfer can only happen once (FAILED - 17)
#     rejects a transfer if the sender does not have enough funds (does not have a valid account) (FAILED - 18)
#   #reverse_transfer
#     can reverse a transfer between two accounts (FAILED - 19)
#     it can only reverse executed transfers (FAILED - 20)
require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

    def execute_transaction
    if valid? && @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      # binding.pry
      self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end