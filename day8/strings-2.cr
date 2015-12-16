input = File.read("input.txt")
total = 0

input.each_line do |line|
  total += line.gsub(/"|\\/, "**").size + 2
  total -= line.size
end

puts total
