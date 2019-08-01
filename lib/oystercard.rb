# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :entry_station, :list_journeys, :exit_station, :journey
    

  MAXIMUM_BALANCE = 90
  AMOUNT = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
    @list_journeys = []
    @journey = {}
  end

  def top_up(amount)
    error_message = "Maximum balance of #{MAXIMUM_BALANCE} exceeded."
    raise error_message if amount + balance > MAXIMUM_BALANCE

    @balance += amount
  end
  
  def touch_in(entry_station)
    if @balance >= AMOUNT
      @entry_station = entry_station
      @journey[:entry_station] = entry_station

    else
      raise "Not enough money" 
    end
    
  end

  def touch_out(exit_station)
    @balance -= 1
    @exit_station = exit_station
    @entry_station = nil
    @journey[:exit_station] = exit_station
    @list_journeys << @journey
 




  end

  def in_journey?
   (@entry_station != nil)? true : false
  end

  def exit_station
    @exit_station
   end

   private
  def deduct(amount)
    @balance -= amount
  end
   
end
