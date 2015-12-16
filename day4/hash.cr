require "crypto/md5"

secret = "yzbqklnj"
counter = 0
target = "00000"

while true
  current = "#{secret}#{counter}"
  hash = Crypto::MD5.hex_digest(current)

  if hash.starts_with?(target)
    puts "#{hash} : #{current}"
    break
  end

  counter += 1
end

# use release build to get best performance:
#     crystal build --release hash.cr
#     ./hash
