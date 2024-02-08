require './lib/node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

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

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
    else
      old_head = @head
      @head = Node.new(data)
      @head.next_node = old_head
    end
  end

  def insert(position, data)
    if @head == nil
      @head = Node.new(data)
    else
      current = @head
      previous = current
      new_node = Node.new(data)
      counter = 0
      until counter == position
        counter += 1
        previous = current
        current = current.next_node
      end
      previous.next_node = new_node
      new_node.next_node = current
    end
  end

  def find(first_position, return_amount)
    current = @head
    counter = 0
    word_array = []
      until counter == first_position
        counter += 1
        current = current.next_node
      end
      current_counter = counter
      until counter == current_counter + return_amount
        word_array << current.data
        counter += 1
        current = current.next_node
      end
      word_array.join(" ")
  end

  def includes?(data)
    current = @head
    until current.next_node == nil
      if current.data == data
        return true
      else
        return false
      end
      current = current.next_node
    end
  end

  def pop
    current = @head
    until current.next_node.next_node == nil
      current = current.next_node
    end
    last_node_data = current.next_node.data
    current.next_node = nil
    last_node_data
  end
end