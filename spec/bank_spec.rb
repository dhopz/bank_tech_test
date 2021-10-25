require 'Bank'

describe Bank do

    let(:account) { Bank.new } 
    let(:timestamp) {'10-01-2023 12-22-08'}
        
    it 'creates a new bank account' do
        expect(subject.balance).to eq 0
    end

    it 'no transactions' do
        expect(subject.transactions).empty?
    end
    
    describe "#deposit" do
        it "funds can be deposited" do
            account.deposit(10)
            expect(account.balance).to eq 10
        end

        it "adds a timestamp to transaction" do
            account.deposit(10)
            expect(transactions.find { |transaction| transaction[:timestamp]}).to eq timestamp
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