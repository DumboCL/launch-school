arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = []
arr.each do |hsh|
  pass = true
  hsh.values.each do |value|
    value.each do |num|
      pass = false if num.odd?
    end
  end
  new_arr << hsh if pass
end

p new_arr