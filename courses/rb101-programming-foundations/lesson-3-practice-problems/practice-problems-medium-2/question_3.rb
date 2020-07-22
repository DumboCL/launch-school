def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# my answer
# pumpkins
# pumpkins
# rutabaga

# correct answer
# My string looks like this now: pumpkins
# My array looks like this now: ["pumpkins", "rutabaga"]