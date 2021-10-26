require 'statement'

describe Statement do
  subject(:statement) { Statement.new }  

  it 'should have correct headers' do
    expect(statement.headers).to eq('date || credit || debit || balance')
  end

  #i tried and I still don't get stubbs
  describe '#print_statement' do
    it 'should show amount, date and balance' do
      bank = double(:bank)
      #transaction = double([:timestamp=>"26/10/2021 16-09-47", :type=>"Deposit", :amount=>"10.00", :balance=>"10.00"])
      transaction = double(:timestamp=>"26/10/2021 16-09-47", :type=>"Deposit", :amount=>"10.00", :balance=>"10.00")
      allow(bank).to receive(:transactions).and_return([transaction])
      p bank.transactions
      expect(statement.print_statement(bank)).to eq("date || credit || debit || balance\n26/10/2021 16-09-47 || 10.00 || || 10.00")
    end
  end

  describe "A test double" do
    it "returns canned responses from the methods named in the provided hash" do
      dbl = double("Some Collaborator", :foo => 3, :bar => 4)
      expect(dbl.foo).to eq(3)
      expect(dbl.bar).to eq(4)
    end
  end
end