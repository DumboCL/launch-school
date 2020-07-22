flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hsh = {}

flintstones.each_index do |index|
  hsh[flintstones[index]] = index
end

puts hsh
