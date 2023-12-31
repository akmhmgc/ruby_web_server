require 'socket'

port = 3000
server = TCPServer.open(port)

loop do
  # wait for a connection
  socket = server.accept

  loop do
    line = socket.readline.chomp
    puts "Read line: #{line}"

    next unless line.bytesize == 0

    socket.write "HTTP/1.1 200 OK\r\n"
    socket.write "\r\n"
    socket.write "Hello World!\r\n"
    socket.close
    break
  end
end
