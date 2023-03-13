class LinkedList
  attr_reader :head

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    counter = 0
    current_node = @head
    while current_node != nil
      counter += 1
      current_node = current_node.next_node
    end
    counter
  end

  # #head method is utilized with the attr_reader method above

  def tail
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    @tail = current_node
  end

  def at(index)
    return nil if @head.nil? || index > self.size
    pointer = @head
    (1..index).each { |i| pointer = pointer.next_node }
    pointer
  end

  def pop
    return nil if @head.nil?
    
    if @head.next_node.nil?
      removed = @head
      @next_node = nil
      return removed
    end

    current_node = @head
    while current_node != nil
      break if current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    removed = current_node.next_node
    current_node.next_node = nil
    removed
  end

  def contains?(info)
    current_node = @head
    while current_node != nil
      return true if current_node.value == info
      current_node = current_node.next_node
    end
    false
  end

  def find(info)
    counter = 0
    current_node = @head
    while current_node != nil
      if current_node.value == info
        return counter
      end
      current_node = current_node.next_node
      counter += 1
    end
    return nil
  end

  def to_s
    string = ''
    (0...self.size).each { |index| string += "#{self.at(index).value} -> "}
    string += 'nil'
  end

  def print_as_array
    array = []
    current_node = @head
    if @head.nil?
      return array
    else
      while current_node.next_node != nil
        array << current_node.value
        current_node = current_node.next_node
      end
      array << current_node.value
    end
    print array
    print "\n"
  end

  def insert_at(info, index)
    counter = 0
    current_node = @head
    while current_node != nil
      if counter == index-1
        current_node.next_node = Node.new(info, current_node.next_node)
        return
      end
      current_node = current_node.next_node
      counter += 1
    end
  end

  def remove_at(index)
    return nil if @head.nil?
    current_node = @head
    counter = 0
    while current_node != nil
      if counter == index-1
        removed = current_node.next_node.value
        current_node.next_node = current_node.next_node.next_node
        return removed
      end
      current_node = current_node.next_node
      counter += 1
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(1)
list.append(5)
list.prepend(7)
list.prepend(0)
list.print_as_array
p list.size
p list.at(2).value
p list.to_s
p list.pop.value
p list.to_s
p list.contains?(5)
p list.contains?(1)
p list.find(27)
p list.find(1)
list.insert_at(8799, 2)
p list.to_s
p list.remove_at(2)
p list.to_s
list.prepend(41)
p list.head.value
p list.tail.value