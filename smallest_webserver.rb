require 'socket'

port = 3000
server = TCPServer.open(port)

# wait for a connection
socket = server.accept

loop do
  line = socket.readline.chomp
  puts "Read line: #{line}"
  break if line.bytesize == 0
end
