class Octal
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless valid?
    decimal = 0
    digits = number.to_i.digits
    digits.each_with_index do |value, index|
      decimal += value * (8**index)
    end
    decimal
  end

  private

  attr_reader :number

  def valid?
    number.count("a-zA-Z") == 0 &&
      number.to_i.digits.all? { |num| num < 8 }
  end
end

puts Octal.new('011').to_decimal
