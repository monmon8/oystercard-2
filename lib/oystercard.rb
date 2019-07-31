# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90
  AMOUNT = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    error_message = "Maximum balance of #{MAXIMUM_BALANCE} exceeded."
    raise error_message if amount + balance > MAXIMUM_BALANCE

    @balance += amount
  end
  
  def touch_in
    if @balance >= AMOUNT
    @in_journey = true
    else
      raise "Not enough money" 
    end
    
  end

  def touch_out
    @in_journey = false
    @balance -= 1


  end

  def in_journey?
    @in_journey
  end
   private
  def deduct(amount)
    @balance -= amount
  end
end
