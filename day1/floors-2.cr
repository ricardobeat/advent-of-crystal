input = File.read("input.txt")
floor = 0

input.each_char_with_index do |char, index|
  floor += 1 if char == '('
  floor -= 1 if char == ')'
  if floor == -1
    puts index + 1
    break
  end
end

puts floor
