# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  AMOUNT = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    error_message = "Maximum balance of #{MAXIMUM_BALANCE} exceeded."
    raise error_message if amount + balance > MAXIMUM_BALANCE

    @balance += amount
  end
  
  def touch_in(station)
    if @balance >= AMOUNT
      @entry_station = station
    else
      raise "Not enough money" 
    end
    
  end

  def touch_out
    @entry_station = nil
    @balance -= 1


  end

  def in_journey?
   (@entry_station != nil)? true : false
  end

   private
  def deduct(amount)
    @balance -= amount
  end
end
