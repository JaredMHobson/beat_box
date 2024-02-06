class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
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
    @head.data.to_s
  end
end