require 'socket'

class MyTCPServer
  attr_reader :socket

  def initialize(local_port, local_host)
    @socket = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(local_port, local_host)
    @socket.bind(addr)
    @socket.listen(5)
  end

  def serve
    loop do
      puts "Server ready to accept connections"
      connection, _ = socket.accept
      message = connection.gets
      puts "Message received: #{message}"
      connection.puts "#{message}"
      connection.close
    end
  end
end

server = MyTCPServer.new(4481, '127.0.0.1')
server.serve
