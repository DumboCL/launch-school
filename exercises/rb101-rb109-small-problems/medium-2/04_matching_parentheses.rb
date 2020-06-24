def balanced?(str)
  counter = 0
  
  str.chars.each do |chr|
    counter += 1 if chr == '('
    counter -= 1 if chr == ')'
    
    break if counter < 0
  end
  
  counter == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
