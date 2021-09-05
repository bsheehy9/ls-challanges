class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(datum)
    @list << Element.new(datum, @list[-1])
  end

  def peek
    return nil if @list.empty?
    @list[-1].datum
  end

  def head
    @list[-1]
  end

  def pop
    popped = @list.pop
    popped.datum
  end

  def self.from_a(arr = [])
    arr = [] unless arr.instance_of?(Array)
    new_list = new()
    unless arr.empty?
      arr.reverse.each do |element|
        new_list.push(element)
      end
    end
    new_list
  end

  def to_a
    new_list = []
    @list.reverse.each do |element|
      new_list << element.datum
    end
    new_list
  end

  def reverse
    new_list = self.class.new()
    (0...@list.size).to_a.reverse.each do |index|
      new_list.push(@list[index].datum)
    end
    new_list
  end

  protected

  attr_reader :list
end
