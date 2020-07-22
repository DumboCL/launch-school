ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# 1
puts ages.key?("Spot")
puts ages.has_key?("Spot")
puts ages.assoc("Spot")

# answer
puts ages.key?("Spot")
puts ages.include?("Spot")
puts ages.member?("Spot")
