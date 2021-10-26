class Bank
    attr_reader :balance, :transactions
      
    def initialize()
        @balance = 0
        @transactions = []
    end

    def transaction(type, amount)
        balance = balance_check(type,amount)
        @transactions.push({timestamp:Time.now.strftime("%d/%m/%Y %H-%M-%S"), type:type, amount: '%.2f' % amount, balance: '%.2f' % balance})
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
