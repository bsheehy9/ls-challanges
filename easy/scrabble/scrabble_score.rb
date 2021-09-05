class Scrabble
  POINTS = { 'AEIOULNRST' => 1,
             'DG' => 2,
             'BCMP' => 3,
             'FHVWY' => 4,
             'K' => 5,
             'JX' => 8,
             'QZ' => 10 }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?
    letters = word.upcase.gsub(/[^A-Z]/, '').chars
    letters.map do |letter|
      POINTS.select do |all_letters, _|
        all_letters.include?(letter)
      end.values[0]
    end.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  private

  attr_reader :word
end

p Scrabble.new('').score
p Scrabble.score('score')
