class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_array)
    word_array.select do |match|
      word_chars = word.downcase.chars
      match_chars = match.downcase.chars

      word_chars != match_chars &&
        word_chars.sort == match_chars.sort
    end
  end

  private

  attr_reader :word
end

anagram = Anagram.new('listen')
p anagram.match %w(enlists google inlets banana)
