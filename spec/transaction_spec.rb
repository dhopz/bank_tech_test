require 'transaction'

describe Transaction do
  #subject(:transaction) { Transaction.new }

  before do
    @new_transaction = Transaction.new("Deposit",10,10)
  end

  it 'creates transaction object' do
    expect(@new_transaction).to have_attributes(:amount => "10.00", :type => "Deposit", :balance => "10.00")
  end
end

  