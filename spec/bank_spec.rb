# frozen_string_literal: true

require 'Bank'

describe Bank do
  let(:account) { Bank.new }
  let(:time_now) { Time.now.strftime('%d/%m/%Y %h-%m-%s') }

  before { Timecop.freeze(time_now) }
  after { Timecop.return }

  it 'creates a new bank account' do
    expect(subject.balance).to eq 0
  end

  it 'transactions to be empty' do
    expect(subject.transactions).to be_empty
  end

  it 'transactions stored' do
    account.transaction('Deposit', 6.3)
    expect(account.transactions[0]).to have_attributes(amount: '6.30', type: 'Deposit')
  end

  it '.checks for a date' do
    account.transaction('Deposit', 10)
    expect(account.transactions.last).to have_attributes(date: '10/10/2021')
  end

  describe '#withdrawal' do
    it '.funds are withdrawn' do
      account.transaction('Deposit', 10)
      account.transaction('Withdraw', 7)
      expect(account.balance).to eq 3
    end
  end
end
