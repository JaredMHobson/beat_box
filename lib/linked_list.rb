require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  # def append(data)
  #   @head = Node.new(data)
  # end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current = @head
      until current.next_node == nil
        current = current.next_node
      end
      current.next_node = Node.new(data)
    end
  end

  def count
    current = @head
    counter = 0
    until current == nil
      counter += 1
      current = current.next_node
    end
    counter
  end

  def to_string
    current = @head
    word_array = []
    until current == nil
      word_array << current.data
      current = current.next_node
    end
    word_array.join(" ")
  end
end

