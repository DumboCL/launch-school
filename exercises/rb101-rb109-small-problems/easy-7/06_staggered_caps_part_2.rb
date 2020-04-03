def staggered_case(string)
  need_upcase = true
  changed_string = ''
  string.chars.map do |char|
                     if char =~ /[a-zA-Z]/
                       if need_upcase
                         changed_string << char.upcase
                       else
                         changed_string << char.downcase
                       end

                       need_upcase = !need_upcase
                     else
                       changed_string << char
                     end
                   end

  changed_string
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'