def step(start, ending, step)
  (start..ending).each do |number|
    if (number - start) % step == 0
      yield(number)
    end
  end

  (start..ending)
end


p step(1, 10, 3) { |value| puts "value = #{value}" }
