require_relative "account"

describe BankAccount do
  let(:account) { BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit") }

  describe 'Getters' do
    it 'has a way to access the account name' do
      expect(account.name).to eq 'Bruce Lee'
    end

    it 'has a way to access the account iban' do
      expect(account.iban).to match /FR14\*+606/
    end

    it 'has a way to access the account position' do
      expect(account.position).to eq 200
    end
  end

  describe '#to_s' do
    it 'returns a string' do
      expect(account.to_s).to be_a String
    end

    it 'returns data about the account' do
      expect(account.to_s).to match /#{account.name}/
    end
  end

  describe '#withdraw' do
    it 'changes the accounts position' do
      account.withdraw(200)
      expect(account.position).to eq 0
    end

    it 'returns a message containing the withdrawn amount' do
      expect(account.withdraw(150)).to match /150/
    end

    it 'does not allow the withdrawal of more than the position' do
      account.withdraw(300)

      expect(account.position).to eq 200
    end
  end

  describe '#deposit' do
    it 'changes the accounts position' do
      account.deposit(200)
      expect(account.position).to eq 400
    end

    it 'returns a message containing the deposit amount' do
      expect(account.deposit(150)).to match /150/
    end
  end

  describe '#transactions_history' do
    it 'verifies the given password' do
      expect(account.transactions_history(password: 'sdofijdsi')).to eq 'wrong password'
    end

    it 'is not happy if you do not give it any password' do
      expect(account.transactions_history()).to eq 'no password given'
    end

    it 'displays all your transactions if given the correct password' do
      account.instance_variable_set(:@transactions, [300])
      expect(account.transactions_history(password: 'brucelit')).to match /300/
    end
  end
end