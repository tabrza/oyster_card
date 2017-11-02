class Oystercard
  attr_reader :balance, :in_journey, :travel_history

  MAXIMUM_AMOUNT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @travel_history = []
    @journey = Journey.new
  end

  def top_up(amount)
    exceed?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    overdrawn?
    in_journey?
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    travel_history << journey.current(@entry_station, exit_station)
    @entry_station = nil
  end

  private

  def in_journey?
    raise "Already touched in" if @entry_station
  end

  def exceed?(amount)
    raise "Balance cannot exceed #{MAXIMUM_AMOUNT}." if @balance + amount > MAXIMUM_AMOUNT
  end

  def overdrawn?
    raise "Insufficient funds" if @balance < MINIMUM_FARE
  end

  def deduct(cost)
    @balance -= cost
  end
end
