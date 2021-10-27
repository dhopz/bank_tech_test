require 'statement'

describe Statement do
  subject(:statement) { Statement.new }  

  it 'should have correct headers' do
    expect(statement.headers).to eq('date || credit || debit || balance')
  end
  
  describe '.print_statement' do
    it 'should show amount, date and balance' do
      bank = double(:bank)
      transaction = double(date:"26/10/2021", type:"Deposit", amount:"10.00", balance:"10.00")
      allow(bank).to receive(:transactions).and_return([transaction])
      expect(statement.print_statement(bank)).to eq("date || credit || debit || balance\n26/10/2021 || 10.00 || || 10.00")
    end

    it 'should show a debit' do
      bank = double(:bank)
      transaction1 = double(date:"26/10/2021", type:"Deposit", amount:"10.00", balance:"10.00")
      transaction2 = double(date:"26/10/2021", type:"Withdraw", amount:"7.00", balance:"3.00")
      allow(bank).to receive(:transactions).and_return([transaction1,transaction2])
      expect(statement.print_statement(bank)).to eq("date || credit || debit || balance\n26/10/2021 || || 7.00 || 3.00\n26/10/2021 || 10.00 || || 10.00")
    end
  end
end