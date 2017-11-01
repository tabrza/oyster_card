class Oystercard
  attr_reader :balance, :in_journey, :entry_station, :travel_history

  MAXIMUM_AMOUNT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @travel_history = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{MAXIMUM_AMOUNT}." if exceed?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if overdrawn?
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @travel_history << { entry_station: @entry_station, exit_station: station}
    @entry_station = nil
  end

  def in_journey?
    @entry_station ? true : false
  end

  private

  def exceed?(amount)
    @balance + amount > MAXIMUM_AMOUNT ? true : false
  end

  def overdrawn?
    @balance < MINIMUM_FARE
  end

  def deduct(cost)
    @balance -= cost
  end
end
