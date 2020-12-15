def convert_to_base_8(num)
  num.to_s(8).to_i  # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
result = [8, 10, 12, 14, 16, 33].map(&base8_proc)

puts result == [10, 12, 14, 16, 20, 41]
