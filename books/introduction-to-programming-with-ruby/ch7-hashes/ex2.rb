hash_a = {height: 180, weight: 200}
hash_b = {color: "blue", shape: "circle"}

hash_a.merge(hash_b)
puts "after merge method, hash_a = #{hash_a}"

hash_a = {height: 180, weight: 200}
hash_b = {color: "blue", shape: "circle"}

hash_a.merge!(hash_b)
puts "after merge! method, hash_a = #{hash_a}"