=begin

Problem: given a letter, create a diamond where the letter given 
is the middle (fattest) part of the diamond

Examples: Given in the question

Data: strings, array (constant) to hold alphabet

Algorithm:

=end

class Diamond
  ALPHABET = ('A'..'X').to_a

  def self.make_diamond(letter)
    middle = ALPHABET.index(letter)
    spaces = middle - 1
    (0..middle).each do |index|
      if index == 0
        puts "#{' ' * spaces}#{ALPHABET[index]}#{(' ' * spaces)}"
      else
        puts "#{' ' * spaces}#{ALPHABET[index]}#{(' ' * (middle - spaces))}#{ALPHABET[index]}#{' ' * spaces}"
      spaces -= 1
    end
  end
end

Diamond.make_diamond('G')