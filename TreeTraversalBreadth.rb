class Tree
  attr_accessor :payload, :children     #makes payload and children read/write

  def initialize(payload, children = []) #initialize the creation of the Tree with the attributes
    @payload = payload                  #payload and children.  Sets Children to an empty array
    @children = children
  end
end

class MyQueue
  def initialize
    @queue = [] #create an empty array called queue
  end

  def enqueue(tree_item)
    @queue.push(tree_item) 
  end

  def dequeue
    @queue.shift #pop "item" off the queue
  end
end

# after we dequeue item, 
#print it
#check to make sure it's not the value
#if its not the value we queue up its children
#if it is the value you print and end

def bfs(tree, value)
  q = MyQueue.new
  q.enqueue(tree)
  current_tree = q.dequeue() #need to do something when i dequeue 
  
  while current_tree != nil
      puts current_tree.payload

    if current_tree.payload != value
      current_tree.children.each do |leaf|
        q.enqueue(leaf)
      end
    else
      q = MyQueue.new
    end
    current_tree = q.dequeue()
  end
end

# queue = MyQueue.new
# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue
# # queue.enqueue(3)
# # queue.enqueue(4)
# # queue.enqueue(5)
# # puts queue.dequeue
# # queue.enqueue(6)
# # puts queue.dequeue
# # puts queue.dequeue
# # puts queue.dequeue
# # puts queue.dequeue

deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])


bfs(trunk, 11)




