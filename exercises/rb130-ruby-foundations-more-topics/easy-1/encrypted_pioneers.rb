INPUT = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
OUTPUT = "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm"

file = File.open("encrypted_pioneers.txt")
file_data = file.readlines.map(&:chomp)
file.close

p file_data

file_data.map! do |name|
  name.tr(INPUT, OUTPUT)
end

p file_data
