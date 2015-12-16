input = File.read("input.txt")
total = 0
mem = 0

input.each_line do |line|
  total += line.size
  mem += line.gsub(/\\("|\\|x[0-f]{2})/, "*").size - 2
end

puts total - mem
