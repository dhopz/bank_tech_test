class Statement

    def headers
        'date || credit || debit || balance'
    end

    def print_statement(bank)
        transactions = format_transactions(bank.transactions)
        return "#{headers}" + "#{transactions}"
    end

    def format_transactions(transaction_history)
        transactions = ''
        transaction_history.reverse_each do |transaction|           
            if transaction[:type] == 'Deposit'
                transactions += "\n#{transaction[:timestamp]} || #{transaction[:amount]} || || #{transaction[:balance]}"
            else transaction[:type] == 'Withdraw'
                transactions += "\n#{transaction[:timestamp]} || || #{transaction[:amount]} || #{transaction[:balance]}"
            end
        end   
        return transactions     
    end
end
