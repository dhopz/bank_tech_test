require 'Bank'
require 'active_support/time'
require 'timecop'

describe Bank do

    let(:account) { Bank.new } 
    let(:time_now) { Time.now.strftime("%d/%m/%Y %h-%m-%s") } 
    
    before { Timecop.travel(time_now) }
    after { Timecop.return }

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

    it "transaction timestamp recorded" do
        account.deposit(7.3)
        expect(account.transactions[timestamp]).to eq :time_now      
    end
            
    
    it 'creates a new bank account' do
        expect(subject.balance).to eq 0
    end

    it 'transactions to be empty' do
        expect(subject.transactions).to be_empty
    end
    
    describe "#deposit" do
        it "funds can be deposited" do
            account.deposit(10)
            expect(account.balance).to eq 10
        end

        # it "checks for a timestamp" do
        #     account.deposit(10)
        #     puts (Time.now + 1.minute)
        #     expect(account.transactions.find { |transaction| transaction[:timestamp]}).to be_within(10.seconds).of Time.now
        # end

    end

    describe "#withdrawal" do
        it "funds are withdrawn" do            
            account.deposit(10)
            account.withdraw(7)
            expect(account.balance).to eq 3
        end
    end

    

    
end