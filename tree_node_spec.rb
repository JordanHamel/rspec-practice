require 'rspec'
require_relative 'tnode'

describe TreeNode do
  let(:left_node) {double("left_node")}
  let(:right_node) {double("right_node")}
  let(:parent) {double("parent")}



  subject(:tree) {TreeNode.new}

  describe "#left_child" do
    it "starts as nil" do
      tree.left_child.should == nil
    end
  end

  describe "#left_child=" do
    it "sets another node as child" do
      left_node.should_receive(:parent=)
      tree.left_child = left_node
      tree.left_child.should == left_node
    end
  end

  describe "#right_child" do
    it "starts as nil" do
      tree.right_child.should == nil
    end
  end

  describe "#right_child" do
    it "sets another node as child" do
      right_node.should_receive(:parent=)
      tree.right_child = right_node
      tree.right_child.should == right_node
    end
  end

  describe "#children" do
    it "list begins with no children" do
      tree.children.should == [nil, nil]
    end
    it "it has up to two children" do
      tree.children.length.should == 2
      left_node.should_receive(:parent=)
      tree.left_child = left_node
      tree.children.length.should == 2
    end
  end


  context "make a tree" do
      let(:tree_node) do
        tree_node = TreeNode.new(1)
        tree_node.left_child = TreeNode.new(2)
        tree_node.left_child.left_child = TreeNode.new(3)
        tree_node.left_child.right_child = TreeNode.new(4)
        tree_node.right_child = TreeNode.new(5)
        tree_node
      end

    describe "#bfs" do
      it "finds shortest path to target" do
        tree_node.bfs(5).should equal(tree_node.right_child)
      end
      it "returns nil if target isn't found" do
        tree_node.bfs(100).should equal(nil)
      end
    end
  end
end





