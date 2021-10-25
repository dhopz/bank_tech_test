require 'Bank'

describe Bank do
        
    it 'creates a new bank account' do
        expect(subject.balance).to eq 0
    end
    
    describe "#deposit" do
        it "funds can be deposited" do
            bank = Bank.new
            bank.add_funds(10)
            expect(bank.balance).to eq 10
        end
    end

    
end