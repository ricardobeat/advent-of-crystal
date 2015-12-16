require "matrix"

input = File.read("input.txt")
lights = Matrix(Int32).new(1000, 1000, 0)

input.each_line do |line|
  col_start, row_start, col_end, row_end = line.scan(/(\d+)\D?/).map &.[1].to_i32

  (row_start..row_end).each do |row|
    (col_start..col_end).each do |col|
      case true
      when line.starts_with?("turn on")  then lights[row, col] += 1
      when line.starts_with?("turn off") then lights[row, col] -= 1 if lights[row, col] > 0
      when line.starts_with?("toggle")   then lights[row, col] += 2
      end
    end
  end
end

puts lights.sum
