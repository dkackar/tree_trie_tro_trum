class DictionaryTree

  attr_reader :root

  def initialize(array=nil)

    @root = LetterNode.new
    @array =  array
    #create_tree(array)
    
  end

  # def create_tree(array)
  #   if array.nil?
  #      return
  #   end    

  #   level = 0
  #   array.each do |word_definition|
  #     loop do
  #       if @root.nil?
  #          @root.letter = word_definition[0]
  #          @root.definition = word_definition[1]
  #          @root.children = nil
  #          @root.parent = nil
  #          @root.depth = level
  #          node = @root
  #          break
  #       elsif word_definition[0] < node.left 
  #         if node.left.nil?
  #           new_node = LetterNode.new
  #           new_node.letter = word_definition[0]
  #           new_node.definition = word_definition[1]
  #           @root.children = nil
  #           @root.parent = node
  #                break
  #         end
  #       else
  #         if node.right.nil?
  #           new_node = LetterNode.new
  #           new_node.letter = word_definition[0]
  #           new_node.definition = word_definition[1]
  #           @root.children = nil
  #           @root.parent = node
  #           break
  #         end
  #       end
  #     end
  #   end
  # end

  def definition_of(array)
    if root.nil?
        # @root.letter = array[0][0]
        # @root.definition = array[0][1]
        # @root.children = []
        # @root.parent = nil
        # @root.depth = 0
    end

  end

  def num_letters

  end

    
end  