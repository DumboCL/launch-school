arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |each_arr|
            each_arr.sort
          end

p new_arr