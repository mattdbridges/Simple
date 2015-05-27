puts <<-EX

Machine.new(
  Sequence.new(
    Assign.new(:x, Number.new(3)),
    Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))
  ),
  { }
).run

EX
