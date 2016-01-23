class DictionaryTree

  attr_reader :root

  def initialize(array=nil)

    @root = LetterNode.new
    @array =  array
    create_tree(array)
    
  end

  def create_tree(array)
    return if array.nil?
    
    array.each do |word_definition|
      insert_word(*word_definition)
    end

  end

  def insert_word(word,definition)
    node = @root
    depth = 0

    word.split("").each do |letter|
      node,depth = insert_letter(node,letter,depth)
    end
    
    node.definition = definition  
  end

  def insert_letter(node,letter,depth)

    if node.children.nil? 
       node.children = []
       new_node = LetterNode.new
       depth += 1
       new_node.depth = depth
       new_node.parent = node
       new_node.letter = letter
       node.children << new_node
       return new_node,depth
    else 
       depth += 1
       node.children.each do |child|
         return child,depth if child.letter == letter
       end
       
       new_node = LetterNode.new
       new_node.depth = depth 
       new_node.parent = node
       new_node.letter = letter
       node.children << new_node
       return new_node,depth
    end

  end
  
  def remove_word(word)

    node = @root

    word.split("").each do |letter|
      return if node.nil?
      node = find_letter(node,letter)
    end
    
    # node = find_end_of_word(node,word)
    # return if node == nil

    node.definition = nil   #set the definition at last node to nil

    if !node.children.nil?
      return
    end

    while node != @root && node.definition == nil
    
      if node.parent.children.length == 1
        node.parent.children = nil
        node = node.parent
      else
        node = node.parent
        break
      end
    end
    
    if node.definition == nil || node == @root
      
      node.children.each_with_index do |child,index|
        if child.letter == word[0]
          node.children.delete_at(index)
        end 
      end
    end 

  end

  def definition_of(word) 
    node = @root
    
    word.split("").each do |letter|
      node = find_letter(node,letter)
      break if node.nil?
    end
    
    node.nil? ? (nil) : (definition = node.definition)
  end

  def find_end_of_word(node,word)
    word.split("").each do |letter|
      return nil if node.nil?
      node = find_letter(node,letter)
    end
  end 

  def find_letter(node,letter)
    return nil if node.children.nil?
    node.children.each do |child|
      return child if child.letter == letter   
    end
    nil
  end
  
  def num_letters
    node = @root
    get_num_letters(node,0)
  end

  def get_num_letters(node,total=0)
    return  0 if node.children.nil?
    total = node.children.length 
    node.children.each do |child|
      total = total + get_num_letters(child)
    end
    total
  end

  def num_words
    node = root
    get_num_words(node)
  end

  def get_num_words(node)
    
    total = node.definition.nil? ? (0) : (1)
    return total if node.children.nil?

    node.children.each do |child|
      total = total + get_num_words(child)
    end

    total
  end  

  def depth
    node = @root
    get_depth(node)
  end
  
  def get_depth(node)
    return node.depth if node.children.nil?
    depth = []

    node.children.each do |child|
      depth << get_depth(child)
    end
    return depth.max
  end 
 
end