total = 0
total_ribbon = 0

File.read("input.txt").each_line do |size|
  sizes = size.split("x").map &.to_i
  x, y, z = sizes

  area = 2*(x*y) + 2*(y*z) + 2*(x*z)

  s1, s2 = sizes.sort

  slack = s1 * s2
  ribbon = s1 + s1 + s2 + s2
  bow = x * y * z

  total += slack + area
  total_ribbon += ribbon + bow
end

puts total
puts total_ribbon
