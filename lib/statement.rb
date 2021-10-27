# frozen_string_literal: true

# Statement to print the statement in format
class Statement
  def headers
    'date || credit || debit || balance'
  end

  def print_statement(bank)
    transactions = format_transactions(bank.transactions)
    headers.to_s + transactions.to_s
  end

  def format_transactions(transaction_history)
    transactions = ''
    transaction_history.reverse_each do |transaction|
      transactions += if transaction.type == 'Deposit'
                        "\n#{transaction.date} || #{transaction.amount} || || #{transaction.balance}"
                      else
                        "\n#{transaction.date} || || #{transaction.amount} || #{transaction.balance}"
                      end
    end
    transactions
  end
end
