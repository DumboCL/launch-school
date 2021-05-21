birds = %w[raven finch hawk eagle]

def my_method(arr)
  return unless block_given?

  yield(arr)
end

my_method(birds) { |_, _, *raptors| puts raptors }
