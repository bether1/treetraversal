class Tree
  attr_accessor :payload, :children     #makes payload and children read/write

  def initialize(payload, children = []) #initialize the creation of the Tree with the attributes
    @payload = payload                  #payload and children.  Sets Children to an empty array
    @children = children
  end
end


def tree_traversal(tree, value)
  puts tree.payload
  if tree.payload == value
    return value

  elsif tree.children.any?
    tree.children.each do |child_tree|
      tree_traversal(child_tree, value)
    end
  else return nil
  end
end




#should traverse in 2, 7, 6, 5, 11

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

tree_traversal(trunk, 11)

#pass in trunk
#search for value not inside tree like number 13 (what return?)
#read up on recursion
