puts <<-EX

Machine.new(
  LessThan.new(
    Number.new(5),
    Add.new(Number.new(2), Number.new(2))
  )
).run

EX
