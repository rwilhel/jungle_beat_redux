require 'pry'

class LinkedList
  attr_reader :head
  attr_accessor :count

  def initialize(head = nil)
    @head = head
    @count = 0
  end

  def append(data)
    node = Node.new(data)
    @count += 1
    node.next_node = @head
    @head = node
    @head.data
  end

  def to_string
    string = ""
    if @head
      string += @head.data.to_s unless @head == nil
      next_node = @head.next_node
      while next_node
        string += " #{next_node.data.to_s}"
        next_node = next_node.next_node
      end
    end
    string
    binding.pry
  end

end
