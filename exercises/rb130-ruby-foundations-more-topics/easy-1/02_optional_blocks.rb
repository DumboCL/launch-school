def compute_arg(arg_1)
  return yield(arg_1) if block_given?
  "Does not compute."
end

def compute
  return yield if block_given?
  "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { "a" + "b" } == "ab"
p compute == "Does not compute."

p compute_arg("hi") { |para| "#{para} #{5 + 3}" }
p compute_arg("hello") { |para| "#{para} #{"a" + "b"}" }
p compute_arg("no_block")
