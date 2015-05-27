require_relative './simple.rb'

class Tree < Struct.new(:machine)
  def to_s
    result = ''
    root = machine.expression # Add

    if has_right?(root) # true
      print_node(result, ' ', true, root.right)
      result << " |\n"
    end

    result << "-o #{root.to_s}\n"

    if has_left?(root)
      result << " |\n"
      print_node(result, ' ', false, root.left)
    end

    result
  end

  private

    def print_node(result, line, right, expression)
      if has_right?(expression)
        print_node(result, line + (right ? '  ' : '| '), true,
                   expression.right)
        result << "#{line}#{right ? ' ' : '|'} |\n"
      end

      result << "#{line}+-o #{expression.tree_name}\n"

      if has_left?(expression)
        result << "#{line}#{right ? '|' : ' '} |\n"
        print_node(result, line + (right ? '| ' : '  '), false,
                   expression.left)
      end
    end

    def has_right?(heap)
      heap.respond_to?(:right) && heap.right
    end

    def has_left?(heap)
      heap.respond_to?(:left) && heap.left
    end
end
