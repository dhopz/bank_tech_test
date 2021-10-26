require 'Bank'

describe Bank do

    let(:account) { Bank.new } 
    let(:time_now) { Time.now.strftime("%d/%m/%Y %h-%m-%s") } 
    
    before { Timecop.freeze(time_now) }
    after { Timecop.return }
    
    it 'creates a new bank account' do
        expect(subject.balance).to eq 0
    end

    it 'transactions to be empty' do
        expect(subject.transactions).to be_empty
    end

    it "transactions stored" do
        account.deposit(10)
        expect(account.transactions).to include(have_key(:timestamp))
        expect(account.transactions).to include(have_key(:type))
        expect(account.transactions).to include(have_key(:amount))        
    end

    it "transactions stored in array" do
        account.deposit(6.3)
        expect(account.transactions).to include(include(:amount=>6.3))        
    end       
    
    
    describe "#deposit" do
        it ".funds can be deposited" do
            account.deposit(10)
            expect(account.balance).to eq 10
        end

        it ".checks for a timestamp" do
            account.deposit(10)            
            expect(account.transactions.last).to eq(:timestamp=>"10/10/2021 00-00-00", :amount=> 10, :type=> "Deposit")
        end

    end

    describe "#withdrawal" do
        it "funds are withdrawn" do            
            account.deposit(10)
            account.withdraw(7)
            expect(account.balance).to eq 3
        end
    end

    

    
end