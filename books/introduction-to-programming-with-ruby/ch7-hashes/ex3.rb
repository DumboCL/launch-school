personal = {height: 180, weight: 200, hair: "brown", head: "round"}

personal.each_key {|k| puts k}
personal.each_value {|v| puts v}
personal.each {|k, v| puts "#{k} is #{v}"}