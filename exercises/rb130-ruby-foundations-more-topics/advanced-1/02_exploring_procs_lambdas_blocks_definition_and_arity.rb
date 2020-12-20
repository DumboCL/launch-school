# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
def block_method_1(animal)
  yield if block_given?
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."}

puts method(:block_method_1).arity
puts method(:block_method_2).arity
puts my_proc.arity
puts my_lambda.arity
=begin

Group 1:

A new Proc object can be created with a call of proc instead of Proc.new
A Proc is an object of class Proc
A Proc object does not require that the correct number of arguments are passed to it. If nothing is passed, then nil is assigned to the block variable.
Group 2

A new Lambda object can be created with a call to lambda or ->. We cannot create a new Lambda object with Lambda.new
A Lambda is actually a different variety of Proc.
While a Lambda is a Proc, it maintains a separate identity from a plain Proc. This can be seen when displaying a Lambda: the string displayed contains an extra "(lambda)" that is not present for regular Procs.
A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, then an error is thrown.
Group 3

A block passed to a method does not require the correct number of arguments. If a block variable is defined, and no value is passed to it, then nil will be assigned to that block variable.
If we have a yield and no block is passed, then an error is thrown.
Group 4

If we pass too few arguments to a block, then the remaining ones are assigned a nil value.
Blocks will throw an error if a variable is referenced that doesn't exist in the block's scope.
Comparison

Lambdas are types of Proc's. Technically they are both Proc objects. An implicit block is a grouping of code, a type of closure, it is not an Object.
Lambdas enforce the number of arguments passed to them. Implicit blocks and Procs do not enforce the number of arguments passed in.



=end