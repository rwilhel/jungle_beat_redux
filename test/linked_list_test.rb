require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'

class LinkedListTest < Minitest::Test

  def test_linked_list_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_linked_list_head_is_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_append_can_add_data
    list = LinkedList.new

    assert_equal "doop", list.append("doop")
  end

  def test_linked_list_returns_next_node
    list = LinkedList.new(nil)
    list.append("doop")

    assert_nil list.head.next_node
  end

  def test_adding_data_to_list_increases_count
    list = LinkedList.new(nil)
    list.append("doop")

    assert_equal 1, list.count
    list.append("deep")

    assert_equal 2, list.count
  end

  def test_list_can_return_string_of_data
    list = LinkedList.new(nil)
    list.append("doop")
    assert_equal "doop", list.to_string

    list.append("deep")
    assert_equal "doop deep", list.to_string
  end

  def test_new_nodes_can_be_added_to_beginning
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")

    assert_equal "dop plop suu", list.to_string
    assert_equal 3, list.count
  end

  def test_new_nodes_can_be_inserted_at_position
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string
  end

  def test_it_can_find_an_element
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "shi", list.find(2,1)
    assert_equal "woo shi shu", list.find(1,3)
  end

  def test_it_includes_supplied_element
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert list.includes?("deep")
  end

  def test_it_can_extract_last_element
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "blop", list.pop
    assert_equal "shu", list.pop
    assert_equal "deep woo shi", list.to_string
  end

end
