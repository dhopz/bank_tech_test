class Transaction

    attr_reader :date, :type, :amount, :balance
  
    def initialize(type, amount, balance, date = Time.now.strftime("%d/%m/%Y"))
      @type = type
      @amount = '%.2f' % amount
      @date = date
      @balance = '%.2f' % balance
    end
  end