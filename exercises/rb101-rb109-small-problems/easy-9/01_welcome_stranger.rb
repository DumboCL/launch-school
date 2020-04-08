def greetings(array, hash)
  name = array.join(' ')
  title_occupation = hash.values.join(' ')
  "Hello, #{name}! Nice to have a #{title_occupation} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == 'Hello, John Q Doe! Nice to have a Master Plumber around.'
