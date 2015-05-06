puts <<-EX

Machine.new(
  If.new(
    Variable.new(:x),
    Assign.new(:y, Number.new(1)),
    Assign.new(:y, Number.new(2))
  ),
  { :x => Boolean.new(true) }
).run

EX

puts <<-EX

Machine.new(
  If.new(
    Variable.new(:x),
    Assign.new(:y, Number.new(1)),
    DoNothing.new
  ),
  { :x => Boolean.new(false) }
).run

EX
