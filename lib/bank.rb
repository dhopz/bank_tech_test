class Bank
    attr_reader :balance, :transactions
      
    def initialize()
        @balance = 0
        @transactions = []
    end

    def deposit(money)
        @balance += money
        @transactions.push({timestamp:Time.now.strftime("%d/%m/%Y %H-%M-%S"), type:"Deposit", amount: money})
    end

    def withdraw(money)
        @balance -= money
    end

end