require_relative 'tree_node'
require_relative 'student'

class BinaryTree
  include Enumerable
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(obj)
    @root.nil? ? @root = TreeNode.new(obj) : insert_node(@root, obj)
  end

  def insert_node(node, obj)
    if obj <= node.obj
      if node.left.nil?
        node.left = TreeNode.new(obj)
      else
        insert_node(node.left, obj)
      end
    else
      if node.right.nil?
        node.right = TreeNode.new(obj)
      else
        insert_node(node.right, obj)
      end
    end
  end

  def each(&block)
    dfs(@root, &block)
  end

  private def dfs(node, &block)
    return if node.nil?
    dfs(node.left, &block)
    yield node
    dfs(node.right, &block)
  end

end