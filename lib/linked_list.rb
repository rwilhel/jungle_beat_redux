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

  def prepend(data)
    node = Node.new(data)
    if @head == nil
      @head = node
    else
      pass_thru = @head
      unless pass_thru.next_node == nil
        pass_thru = pass_thru.next_node
      end
    end
    pass_thru.next_node = node
    node.next_node = nil
    node.data
    @count += 1
  end

  def insert(position, data)
    pass_thru = @head
    pass_thru_amount = count - position
    pass_thru_amount.times do
      pass_thru = pass_thru.next_node
    end
    node = Node.new(data)
    node.next_node = pass_thru
    pass_thru = @head
    (pass_thru_amount - 1).times do
      pass_thru = pass_thru.next_node
    end
    pass_thru.next_node = node
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
    string_set = string.split(" ").reverse
    string = string_set.join(" ")
  end

  def find(position, element_amount)
    pass_thru_last_element = count - position - element_amount
    pass_thru = @head
    pass_thru_last_element.times do
      pass_thru = pass_thru.next_node
    end
    final_included_element = pass_thru
    returned = []
    element_amount.times do
      returned << pass_thru.data
      pass_thru = pass_thru.next_node
    end
    returned_string = returned.reverse.join(" ")
    returned_string
  end

  def includes?(test_data)
     pass_thru = @head
     if pass_thru == nil
       return false
     elsif pass_thru.data == test_data
       return true
     else
       pass_thru = pass_thru.next_node
     end
  end
end
