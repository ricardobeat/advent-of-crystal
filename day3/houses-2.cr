class Actor
  property x
  property y
  @x = 0
  @y = 0
end

santa = Actor.new
robot = Actor.new
actor = santa

houses = {"0:0" => 1} of String => Int32

File.read("input.txt").each_char_with_index do |instruction, index|
  case instruction.to_s
  when "^" then actor.y -= 1
  when "v" then actor.y += 1
  when ">" then actor.x += 1
  when "<" then actor.x -= 1
  end

  key = "#{actor.x}:#{actor.y}"

  houses[key] ||= 1
  houses[key] += 1

  actor = actor === santa ? robot : santa
end

puts houses.size
