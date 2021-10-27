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
        deposit = account.transaction("Deposit",6.3)
        expect(account.transactions[0]).to have_attributes(:amount => "6.30", :type => "Deposit")      
    end
            
    describe "#deposit" do
        it ".funds can be deposited" do
            account.transaction("Deposit",10)
            expect(account.balance).to eq 10
        end

        it ".checks for a date" do
            account.transaction("Deposit",10)       
            expect(account.transactions.last).to have_attributes(:date => "10/10/2021")
        end

        it ".checks balance" do
            account.transaction("Deposit",10)
            account.transaction("Deposit",7)          
            expect(account.balance).to eq(17)
        end

    end

    describe "#withdrawal" do
        it ".funds are withdrawn" do            
            account.transaction("Deposit",10)
            account.transaction("Withdraw",7)
            expect(account.balance).to eq 3
        end        

    end

    #actually - this should be a new class
    # describe "#statement" do 
    #     it ".prints transactions" do
    #         account.deposit(10)  
    #         #p account.statement2           
    #         #expect(account.statement2).to output("10/10/2021 00-00-00 || Deposit || 10").to_stdout
    #         expect(account.statement2).to output("date || credit || debit || balance\n10/10/2021 00-00-00 || 10.00 || || 10.00").to_stdout

    #         #expect { print 'foo' }.to output('foo').to_stdout         
    #     end
    # end
    
end

