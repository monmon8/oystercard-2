# frozen_string_literal: true

require 'oystercard'
require 'station'

describe Oystercard do
  let(:random_station){Station.new}
  let (:entry_station){double(random_station)}
  let (:exit_station){double(random_station)}

  it "stores exit station" do
    subject.top_up(2)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq(exit_station)
    
  end 
  it 'has a balance of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq 0
  end

  it 'has a method top_up' do
    oystercard = Oystercard.new
    expect(oystercard).to respond_to(:top_up).with(1).argument
  end

  it 'can top up the balance' do
    expect { subject.top_up 1 }.to change { subject.balance }.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    error_message = "Maximum balance of #{maximum_balance} exceeded."
    expect { subject.top_up 1 }.to raise_error(error_message)
  end

  # it 'has a method deduct' do
  #   expect(subject).to respond_to(:deduct).with(1).argument
  # end

  it 'has a method touch_in' do
    expect(subject).to respond_to(:touch_in)
  end

  it 'has a method touch_out' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
    subject.top_up(2)
    subject.touch_in(random_station)
    expect(subject).to be_in_journey
  end

  it 'can touch out' do
    subject.top_up(2)
    subject.touch_in(random_station)
    subject.touch_out(random_station)
    expect(subject).not_to be_in_journey
  end

  it "has the minimun amount" do
    expect{subject.touch_in(random_station)}.to raise_error
  end 

  it "deduct the amount from the balance" do
    subject.top_up(2)
    subject.touch_in(random_station)
    expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
  end 
  
  it "remember the name of the station" do
    subject.top_up(2)
    subject.touch_in(random_station)
    expect(subject.entry_station).to eq(random_station)
  end
  it "forgets the entry station on touch out " do
    subject.top_up(2)
    subject.touch_in(random_station)
    subject.touch_out(random_station)
    expect(subject.entry_station).to eq(nil)
  end 
  it "has station of the touch_in" do
    random1_station = Station.new
    subject.top_up(2)
    subject.touch_in(random_station)
    subject.touch_out(random1_station)
    expect(subject.list_journeys).to include(entry_station:random_station,exit_station:random1_station)
  end
  it "has a card that has an empty list of journeys by default" do
    expect(subject.list_journeys).to be_empty
  end 
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
  it "creates one journey when one touch in and touch out" do
  
    subject.top_up(2)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.list_journeys).to include journey
  end

  
end

