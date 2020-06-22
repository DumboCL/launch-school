def toggle_at(hsh, key)
  hsh[key] == 0 ? hsh[key] = 1 : hsh[key] = 0
end

def on_lights(num)
  hsh = {}
  1.upto(num) do |n|
    hsh[n] = 0
  end

  1.upto(num) do |round|
    1.upto(num) do |key|
      toggle_at(hsh, key) if key % round == 0
    end
  end

  hsh.select { |key, value| value == 1 }.keys
end

p on_lights(5) == [1, 4]
p on_lights(10) == [1, 4, 9]
p on_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]