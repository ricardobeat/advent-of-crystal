x = 0
y = 0

houses = {} of String => Int32

File.read("input.txt").each_char do |instruction|
  case instruction.to_s
    when "^" then y -= 1
    when "v" then y += 1
    when ">" then x += 1
    when "<" then x -= 1
  end

  key = "#{x}:#{y}"

  houses[key] ||= 1
  houses[key] += 1
end

puts houses.size
