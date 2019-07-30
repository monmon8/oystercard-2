require "oystercard"

describe Oystercard do
  it 'has a balance of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end
  it 'has a method top_up' do
    oystercard = Oystercard.new
    expect(oystercard).to respond_to(:top_up).with(1).argument
  end
  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end
  it 'raises an error if the maximum balance is exceeded' do 
    maximum_balance = Oystercard::MAXIMUM_BALANCE 
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded."
  end
end
