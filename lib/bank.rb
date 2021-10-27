require_relative 'transaction'

class Bank
    attr_reader :balance, :transactions
      
    def initialize()
        @balance = 0
        @transactions = []
    end

    def transaction(type, amount)
        balance = balance_check(type,amount)
        new_transaction = Transaction.new(type,amount,balance)
        @transactions.push(new_transaction)
    end

    private

    def balance_check(type,amount)
        if type == "Deposit"
            @balance += amount
        else
            @balance -= amount
        end
        return @balance
    end    

end
