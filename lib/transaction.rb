class Transaction

    attr_reader :date, :type, :amount, :account_balance
  
    def initialize(type, account_balance, amount, date = Time.now.strftime("%d/%m/%Y"))
      @type = type
      @amount = '%.2f' % amount
      @date = date
      @account_balance = '%.2f' % account_balance
    end
  end