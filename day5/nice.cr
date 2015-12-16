input = File.read("input.txt")

def is_nice?(word)
  !word.match(/ab|cd|pq|xy/) && word.match(/(.)\1/) && word.scan(/[aeiou]/).size >= 3
end

puts input.lines.count { |word| is_nice?(word) }
