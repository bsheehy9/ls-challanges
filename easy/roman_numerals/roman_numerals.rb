=begin

Problem:
  create a class called RomanNumerals
  will need 2 methods:
    - initialize method that takes an integer argument
    - to_roman which converts integer to string representation
    of number

Examples: given as test cases

Data:
  - integers
  - CONSTANT - hash for roman numberal values

Algorithm:
  - create constant that holds values for roman numerals
  - figure out the different digits values (1, 10, 100, 1000)
  - get each using the least available roman numeral values

=end

class RomanNumeral
  attr_reader :number

  KEY_VALUES = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(num)
    @number = num
  end

  def to_roman
    roman_numeral = ''
    to_convert = number
    KEY_VALUES.each do |letter, value|
      until value > to_convert
        roman_numeral << letter
        to_convert -= value
      end
    end
    roman_numeral
  end
end
