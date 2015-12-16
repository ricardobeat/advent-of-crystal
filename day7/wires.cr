input = File.read("input.txt")

class Gate
  property value
  property has_value

  def initialize(@fn, @cmd)
    @has_value = false
    @value = 0.to_u16
  end

  def run
    return @value if @has_value
    @has_value = true
    @value = @fn.call
  end
end

$state = {} of String => Gate

def parse(line)
  m, operation, output = line.match(/(.+) -> (.+)/) || [] of String
  parts = operation.scan(/[^\s]+/).map &.[0]
  case parts.size
  when 2 then return {type: parts[0], output: output, x: parts[1]}
  when 3 then return {type: parts[1], output: output, x: parts[0], y: parts[2]}
  else        return {type: "PUT", output: output, x: operation}
  end
end

def resolve(x)
  x.match(/\d/) ? x.to_u16 : $state[x].run
end

def wire(cmd)
  case cmd[:type]
  when "AND"    then fn = ->{ resolve(cmd[:x]) & resolve(cmd[:y]) }
  when "OR"     then fn = ->{ resolve(cmd[:x]) | resolve(cmd[:y]) }
  when "LSHIFT" then fn = ->{ resolve(cmd[:x]) << resolve(cmd[:y]) }
  when "RSHIFT" then fn = ->{ resolve(cmd[:x]) >> resolve(cmd[:y]) }
  when "NOT"    then fn = ->{ ~resolve(cmd[:x]) }
  else               fn = ->{ resolve(cmd[:x]) }
  end
  $state[cmd[:output]] = Gate.new(fn, cmd)
end

input.each_line do |line|
  command = parse(line)
  wire(command)
end

puts $state["a"].run

# Part 2
# -----------------------------------------------------------------------------

$state.each do |key, gate|
  if key == "b"
    gate.has_value = true
    gate.value = 956
  else
    gate.has_value = false
  end
end

puts $state["a"].run
