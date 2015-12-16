input = File.read("input.txt")
floor = 0

input.each_char do |char, index|
  floor += 1 if char == '('
  floor -= 1 if char == ')'
end

puts floor
