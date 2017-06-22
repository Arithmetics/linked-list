class Node
  attr_accessor :val, :next

  def initialize(val, next_node)
      @val = val
      @next = next_node
  end
end

class LinkedList
   attr_accessor :head

    def initialize(val)
      @head = Node.new(val, nil)
    end
  
    def head
       @head
    end
  
    def tail
      current = @head
      while current.next != nil
        current = current.next
      end
      current
    end
  
    def atindex(index)
      current = @head
      index.times do 
        current = current.next
      end
      current
    end
  

    def append(val)
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = Node.new(val, nil)
    end
  
    def pop
     current = @head
     while current.next.next != nil
      current = current.next
     end
     current.next = nil
    end
   
    def size
     current = @head
     count = 1
     while current.next !=nil
       current = current.next
       count += 1
     end
     count
    end
   
    def contains?(value)
     current = @head
     has = false
     while current.next !=nil
       if current.val == value
        has = true
       end
       current = current.next
     end 
     if current.val == value
        has = true
     end
      return has
    end
    
    def find(data)
     current = @head
     count = 0
     has = false
     while current.next !=nil 
       if current.val == data
         has = true
         break
       end
       current = current.next
       count += 1
     end
     if current.val == data
       has = true
     end
     if has == false
       return nil
     else
       return count
     end
    end
      
    
    def to_s
      strang = "(head: "
      
      current = @head 
      while current.next !=nil
        strang += ("#{current.val}) => (")
        current = current.next
      end
      strang += ("#{current.val}: ")
      strang += ("tail)")
      return strang
    end
    
    def prepend(val)
      save = @head
      @head = Node.new(val, save)
    end
      
      #this insert at creates a whole new node and shifts the connections, not just overwrites the data!
    def insert_at(data, index)
      current = @head
      index.times do
        current = current.next
      end
        save = current.next.clone
        current.next = nil
        append(data)
        current.next.next = save
    end
    
    def remove_at(index)
      current = @head
      index.times do
        current = current.next
      end
        save = current.next.next.clone
        current.next = nil
        
        current.next = save
    end 
end 