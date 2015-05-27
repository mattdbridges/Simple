class Machine < Struct.new(:expression)

  def step
    self.expression = expression.reduce
  end

  def run
    while expression.reducible?
      puts expression
      step
    end

    puts expression
  end
end

class Number < Struct.new(:value)
  def to_s
    value.to_s
  end

  def tree_name
    value
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    false
  end
end

class Add < Struct.new(:left, :right)
  def to_s
    "#{left} + #{right}"
  end

  def tree_name
    "ADD"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce
    if left.reducible?
      puts "Add: reducing left side - #{left}"
      Add.new(left.reduce, right)
    elsif right.reducible?
      puts "Add: reducing right side - #{right}"
      Add.new(left, right.reduce)
    else
      Number.new(left.value + right.value)
    end
  end
end

class Multiply < Struct.new(:left, :right)
  def to_s
    "#{left} * #{right}"
  end

  def tree_name
    "MULTIPLY"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce
    if left.reducible?
      puts "Multiply: reducing left side - #{left}"
      Multiply.new(left.reduce, right)
    elsif right.reducible?
      puts "Multiply: reducing right side - #{right}"
      Multiply.new(left, right.reduce)
    else
      Number.new(left.value * right.value)
    end
  end
end
