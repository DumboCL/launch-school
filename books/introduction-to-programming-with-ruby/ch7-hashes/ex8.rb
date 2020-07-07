words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
output_array = []
while words.length > 1
  output = []
  for com_index in 0..words.length - 1 do
    if words[0].split('').sort == words[com_index].split('').sort
      output << words[com_index]
    end
  end
  if output.length > 1
    output_array << output
    words = words.difference(output)
  end
end
output_array.each do |arr|
  p arr
end