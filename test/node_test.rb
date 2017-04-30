require 'minitest/autorun'
require 'minitest/pride'
require './lib/node.rb'

class NodeTest < Minitest::Test

  def test_node_exists
    node = Node.new

    assert_instance_of Node, node
  end

  def test_node_can_return_data
    node = Node.new

    assert_equal "plop", node.data
  end

  def test_next_node_data_returns_nil
    node = Node.new

    assert_nil node.next_node
  end
end
