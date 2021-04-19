words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

def anagrams(words)
  hsh = {}

  words.each do |word|
    hsh[sort_word(word)] ||= []
    hsh[sort_word(word)] << word
  end

  hsh.values
end

def sort_word(word)
  word.chars.sort.join
end

p anagrams(words)
