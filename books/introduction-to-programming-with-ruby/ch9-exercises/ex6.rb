a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

a << 11
a.unshift(0)

a.delete(11)
a << 3

a.uniq!
p a