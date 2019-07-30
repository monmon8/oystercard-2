class Oystercard
    attr_reader :balance, :currently_in_use

    MAXIMUM_BALANCE = 90

    def initialize 
        @balance = 0
        @currently_in_use = false 
    end 

    def top_up(amount)
        fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded." if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end 

    def deduct(amount)
        @balance -= amount
    end

    def touch_in
        @currently_in_use = true 
    end

    def touch_out
        @currently_in_use = false
    end

    def in_journey?
        @currently_in_use 
    end
end