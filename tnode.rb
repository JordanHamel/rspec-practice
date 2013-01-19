class TreeNode

  attr_accessor :value, :children, :parent

  def initialize(value = nil)
    @children = [nil, nil]
    @parent = nil
    @value = value
  end

  def left_child
    @children[0]
  end

  def right_child
    @children[1]
  end

  def left_child=(node)
    children[0] = nil unless left_child == nil
    children[0] = node
    node.parent = self
  end

  def right_child=(node)
    children[1] = nil unless right_child == nil
    children[1] = node
    node.parent = self
  end

  def bfs(target)
    nodes = []
    nodes << self
    until nodes.empty?
      front = nodes.shift
      return front if front.value == target
      nodes << front.left_child unless front.left_child.nil?
      nodes << front.right_child unless front.right_child.nil?
    end
    nil
  end
end