puts <<-EX

expression =
  Add.new(
    Multiply.new(Number.new(1), Number.new(2)),
    Multiply.new(Number.new(3), Number.new(4))
  )

EX

puts <<-EX

expression.reducible?

EX

puts <<-EX

expression = expression.reduce

EX
