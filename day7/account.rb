require 'date'
require_relative 'transaction'

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class WithdrawError < StandardError
end

class BalanceError < StandardError
end



class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)

  attr_reader :name, :position

  MIN_DEPOSIT =  100
  MIN_WITHDRAW = 5
  MIN_BALANCE = 0


    def initialize(name, iban, initial_deposit, password)
      fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
      @password = password
      @transactions = []
      @position = 0
      @name, @iban = name, iban

      add_transaction(initial_deposit)
    end
    # def name
    #   @name
    # end
    def withdraw(amount)#,message="")
      #fail WithdrawError, "Insufficient withdraw" unless amount > MIN_WITHDRAW
      if amount <= @position
        add_transaction(amount*-1)#,message)#(-amount)
        "You've just withdrawn #{amount} euros"
      end
      # TODO: Call add_transaction with the right argument
      # TODO: returns a string with a message
    end

    def deposit(amount)#,message="")
      fail DepositError, "Insufficient deposit" unless amount > MIN_DEPOSIT
      add_transaction(amount)#,message)
      "You've just deposit #{amount} euros"
      # TODO: Call add_transaction with the right argument
      # TODO: returns a string with a message
    end

    def transactions_history(args = {})
      # TODO: Check if there is a password and if so if it is correct
      # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
      
      if args[:password] == nil
        "no password given"
      elsif args[:password] != @password
        "wrong password"
      else
        @transactions.join("\n")
      end        
    end

    def iban
      # TODO: Hide the middle of the IBAN like FR14**************606 and return it     
      @iban[0..3]+ "*"*26 + @iban[-3..-1]
    end

    def to_s
      # Method used when printing account object as string (also used for string interpolation)
      # TODO: Displays the account owner, the hidden iban and the position of the account
      "Owner: #{@name}\nIBAN: #{iban}\nCurrent amount: #{@position}\n\n"
    end
    
    private

    def add_transaction(amount)#, message="")  
      #@transactions<< "#{amount} #{t.strftime("on %d%m%y at %l%M%P")}"
      @transactions<<amount#Transaction.new(amount)#,message)
      @position += amount
      
      #fail BalanceError, "Insufficient balance" unless @position > MIN_BALANCE
    end
end

account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")
# sleep 1
# account.deposit(120)
# sleep 2
# account.withdraw(50)
# puts account.transactions_history({:password => "brucelit"})