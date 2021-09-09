class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1

    sum = sum_divisors(number)
    if sum > number
      "abundant"
    elsif sum == number
      "perfect"
    elsif sum < number
      "deficient"
    end
  end

  def self.sum_divisors(number)
    (1...number).select do |num|
      number % num == 0
    end.sum
  end
end

puts PerfectNumber.classify(13)
