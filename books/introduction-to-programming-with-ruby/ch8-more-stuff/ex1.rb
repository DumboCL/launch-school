def has_substring?(str1, str2)
  if str1.include? str2
    puts "#{str1} include #{str2}."
  else
    puts "#{str1} does not include #{str2}."
  end
end

has_substring?("laboratory", "lab")
has_substring?("experiment", "lab")
has_substring?("Pans Labyrinth", "lab")
has_substring?("elaborate", "lab")
has_substring?("polar bear", "lab")