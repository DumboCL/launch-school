def rand_str_hex(num)
  str = ''
  num.times do |n|
    num = Random.new
    str << num.rand(0..15).to_s(16)
  end
  str
end

def create_uuid
  "#{rand_str_hex(8)}-#{rand_str_hex(4)}-#{rand_str_hex(4)}-#{rand_str_hex(4)}-#{rand_str_hex(12)}"
end

p create_uuid