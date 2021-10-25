class Bank
    attr_reader :balance
    
    def initialize()
        @balance = 0  
    end

    def add_funds(deposit)
        @balance += deposit
    end

end