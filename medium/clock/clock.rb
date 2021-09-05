=begin

problem:
  - create clock class
  - class method 'at'
    - mandatory hour parameter
    - optional minute parameter
  - '+' and '-' methods to add minutes
  - output string in 00:00 format
  - 24 hour day

examples: given in tests

data:
  - string output
  - integer inputs

algorithm:
  - create constant for minutes in day
  - take integers and covert to total minutes
  - calculate hours and minutes
  - convert negative hours and more than 24 hours

key rules: 
  - need to make a new clock object if changing time

=end

class Clock
  HOURS_IN_DAY = 24
  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY = 1440

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
    @total_minutes = to_minutes(hour, minute)
  end

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def to_minutes(hours, minutes)
    (hours * MINUTES_IN_HOUR) + minutes
  end

  def convert_time(minutes)
    hour, minute = minutes.divmod(60)
    hour %= HOURS_IN_DAY
    self.class.new(hour, minute)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def +(add_minutes)
    new_minutes = total_minutes + add_minutes
    new_minutes -= MINUTES_IN_DAY if new_minutes > MINUTES_IN_DAY
    convert_time(new_minutes)
  end

  def -(sub_minutes)
    new_minutes = total_minutes - sub_minutes
    if new_minutes < -1440
      new_minutes = new_minutes % 1440
    elsif new_minutes < 0
      new_minutes = MINUTES_IN_DAY + new_minutes
    end
    puts new_minutes
    convert_time(new_minutes)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  private

  attr_accessor :total_minutes

  protected

  attr_accessor :hour, :minute
end

clock = Clock.at(0, 30)
puts clock
puts clock - 60
