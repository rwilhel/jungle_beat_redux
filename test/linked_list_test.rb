require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list.rb'

class LinkedListTest < Minitest::Test

  def test_linked_list_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_linked_list_head_is_nil
    list = LinkedList.new

    assert_nil list.head
  end

end
