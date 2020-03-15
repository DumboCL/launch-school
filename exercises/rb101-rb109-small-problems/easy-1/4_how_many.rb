vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'MOtorcycle', 'car', 'truck'
]

def count_occurrences(vehicles)
  count_hash = {}
  vehicles.each do |vehicle|
    if count_hash[vehicle] == nil
      count_hash[vehicle] = 1
    else
      count_hash[vehicle] += 1
    end
  end

  count_hash
end

puts count_occurrences(vehicles)
