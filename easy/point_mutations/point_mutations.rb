class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(comparison)
    min_length = [strand, comparison].map(&:size).min
    mutation_count = 0
    (0...min_length).each do |index|
      mutation_count += 1 if strand[index] != comparison[index]
    end
    mutation_count
  end

  private

  attr_reader :strand
end

# strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
# distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
# puts DNA.new(strand).hamming_distance(distance)
