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
        account.deposit(6.3)
        expect(account.transactions).to include(have_key(:timestamp))
        expect(account.transactions).to include(have_key(:type))
        expect(account.transactions).to include(have_key(:amount))  
        expect(account.transactions).to include(include(:amount=>6.3))        
    end
            
    describe "#deposit" do
        it ".funds can be deposited" do
            account.deposit(10)
            expect(account.balance).to eq 10
        end

        it ".checks for a timestamp" do
            account.deposit(10)            
            expect(account.transactions.last).to eq(:timestamp=>"10/10/2021 00-00-00", :amount=> 10, :type=> "Deposit", :balance=>10)
        end

        it ".checks balance" do
            account.deposit(10)  
            account.deposit(7)           
            expect(account.balance).to eq(17)
        end

    end

    describe "#withdrawal" do
        it ".funds are withdrawn" do            
            account.deposit(10)
            account.withdraw(7)
            expect(account.balance).to eq 3
        end

        it ".checks for a timestamp" do
            account.deposit(10)  
            account.withdraw(7)          
            expect(account.transactions.last).to eq(:timestamp=>"10/10/2021 00-00-00", :amount=> 7, :type=> "Withdraw", :balance=>3)
        end

        it ".checks balance" do
            account.deposit(10)  
            account.withdraw(7)           
            expect(account.balance).to eq(3)
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

