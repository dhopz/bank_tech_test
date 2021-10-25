require 'Bank'

describe Bank do
        
    it 'creates a new bank account' do
        expect(subject.balance).to eq 0
    end

    
end