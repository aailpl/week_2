require 'date'
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

    def withdraw(amount)
      fail WithdrawError, "Insufficient withdraw" unless amount > MIN_WITHDRAW
      add_transaction(amount*-1)#(-amount)
      "You've just withdrawn #{@position} euros"
      # TODO: Call add_transaction with the right argument
      # TODO: returns a string with a message
    end

    def deposit(amount)
      fail DepositError, "Insufficient deposit" unless amount > MIN_DEPOSIT
      add_transaction(amount)
      "You've just deposit #{@position} euros"
      # TODO: Call add_transaction with the right argument
      # TODO: returns a string with a message
    end

    def transactions_history(args = {})
      # TODO: Check if there is a password and if so if it is correct
      # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
      # if !args.empty?
      #   if args == @password
      #     "transactions:\n" << @transactions.join("\n")
      #   else
      #     "wrong password"
      #   end
      # else
      #     "no password given"
      # end
      if args[:password] == nil
        "Password not found"
      elsif args[:password] != @password
        "Wrong password"
      else
        @transactions.join(",")
      end        
    end

    def iban
      # TODO: Hide the middle of the IBAN like FR14**************606 and return it

      # split=@iban.split("-")
      # [split.first,"\s************\s",split.last].join

      #split.firt.to_s + "*********" + split.last.to_s

      # "#{@iban[0..3]}***********#{@iban[-3..-1]}"

      @iban[0..3]+ "*"*26 + @iban[-3..-1]
    end

    def to_s
      # Method used when printing account object as string (also used for string interpolation)
      # TODO: Displays the account owner, the hidden iban and the position of the account
      "Owner: #{@name}\nIBAN: #{iban}\nCurrent amount: #{@position}\n\n"
    end
    
    private

    def add_transaction(amount)  

      @transactions<<[DateTime.now,amount].join("\t")
      @position += amount

      fail BalanceError, "Insufficient balance" unless @position > MIN_BALANCE
      # if position<0
      #   @position -=amount
      #   "Insufficient balance"
      # end
      
      # TODO: add the amount in the transactions array
      # TODO: update the current position (which represents the balance of the account)
    end
end

account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")
account.deposit(120)
account.withdraw(50)
puts account.transactions_history({:password => "brucelit"})