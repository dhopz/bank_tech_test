# frozen_string_literal: true

# Transaction is now each an object
class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(type, amount, balance, date = Time.now.strftime('%d/%m/%Y'))
    @type = type
    @amount = format('%.2f', amount)
    @date = date
    @balance = format('%.2f', balance)
  end
end
