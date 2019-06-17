#from Jared

class Tree
  attr_accessor :payload, :children     #makes payload and children read/write

  def initialize(payload, children) #initialize the creation of the Tree with the attributes
    @payload = payload                  #payload and children.  Sets Children to an empty array
    @children = children
  end
end


def tree_traversal_helper(tree, tree_values = [])
  tree_values.push(tree.payload)

  tree.children.each do |child_tree|
    tree_traversal_helper(child_tree, tree_values)
  end
    
  return tree_values
end

def tree_traversal(tree, value)
  values = tree_traversal_helper(tree)

  # if values != tree_values
  #   return "not in tree"

  values.each do |v|
    puts v
    if (v == value)
      break
    end
  end
end

#should traverse in 2, 7, 6, 5, 11
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])

tree_traversal(trunk, 11)
