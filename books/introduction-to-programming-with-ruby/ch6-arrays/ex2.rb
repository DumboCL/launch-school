1. 
arr = ["b", "a"]
arr = arr.product(Array(1..3))
arr.first.delete(arr.first.last)
# return
# ["b", ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]] 
# wrong
# the correct answer is 1

2.
arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)
# return
# nil
# wrong
# the correct answer is returns [1, 2, 3]