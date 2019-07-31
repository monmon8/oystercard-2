# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    error_message = "Maximum balance of #{MAXIMUM_BALANCE} exceeded."
    raise error_message if amount + balance > MAXIMUM_BALANCE

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end
