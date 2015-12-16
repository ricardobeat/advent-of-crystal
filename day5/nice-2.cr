input = File.read("input.txt")

def is_nicer?(word)
  word.match(/(..).*\1/) && word.match(/(.).\1/)
end

puts input.lines.count { |word| is_nicer?(word) }
